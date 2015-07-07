Return-Path: <rich.tollerton@ni.com>
X-Greylist: delayed 2966 seconds by postgrey-1.34 at layers.openembedded.org;
	Tue, 07 Jul 2015 03:58:31 UTC
Received: from ni.com (skprod2.natinst.com [130.164.80.23])
	by mail.openembedded.org (Postfix) with ESMTP id 41CFC65CCD
	for <openembedded-core@lists.openembedded.org>;
	Tue,  7 Jul 2015 03:58:31 +0000 (UTC)
Received: from us-aus-mgwout1.amer.corp.natinst.com (nb-chan1-1338.natinst.com
	[130.164.19.134])
	by us-aus-skprod2.natinst.com (8.15.0.59/8.15.0.59) with ESMTP id
	t6738v1h012667; Mon, 6 Jul 2015 22:08:57 -0500
Received: from weregild.amer.corp.natinst.com ([130.164.14.198])
	by us-aus-mgwout1.amer.corp.natinst.com (Lotus Domino Release 8.5.3FP6
	HF1218) with ESMTP id 2015070622085661-680571 ;
	Mon, 6 Jul 2015 22:08:56 -0500 
Message-Id: <87vbdwy88m.fsf@weregild.amer.corp.natinst.com>
From: Richard Tollerton <rich.tollerton@ni.com>
To: "Daniel." <danielhilst@gmail.com>,
	"Robert P. J. Day" <rpjday@crashcourse.ca>
In-Reply-To: <CAF3SDA6sUY=4cg-pihtftzTNDREm5cKMS7MqQp4DJ9M81ez5UQ@mail.gmail.com>
Date: Mon, 6 Jul 2015 21:54:41 -0500
References: <alpine.LFD.2.11.1502190508290.29947@localhost>
	<CAF3SDA6sUY=4cg-pihtftzTNDREm5cKMS7MqQp4DJ9M81ez5UQ@mail.gmail.com>
User-Agent: Notmuch/0.20.1 (http://notmuchmail.org) Emacs/24.5.2
	(x86_64-unknown-linux-gnu)
X-MIMETrack: Itemize by SMTP Server on US-AUS-MGWOut1/AUS/H/NIC(Release
	8.5.3FP6 HF1218|December 12, 2014) at 07/06/2015 10:08:56 PM,
	Serialize by Router on US-AUS-MGWOut1/AUS/H/NIC(Release 8.5.3FP6
	HF1218|December 12, 2014) at 07/06/2015 10:08:56 PM,
	Serialize complete at 07/06/2015 10:08:56 PM
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10432:, ,
	definitions=2015-07-07_01:, , signatures=0
Cc: Yocto discussion list <yocto@yoctoproject.org>,
	openembedded-core@lists.openembedded.org
Subject: [PATCH] cross-localedef-native_2.20.bb: fix for gcc5
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.12
Precedence: list
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.openembedded.org/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.openembedded.org/pipermail/openembedded-core/>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.openembedded.org/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Tue, 07 Jul 2015 03:58:33 -0000

Message-ID: <87wpycy88v.fsf@weregild.amer.corp.natinst.com>
MIME-Version: 1.0
Content-Type: text/plain
--text follows this line--
The build of cross-localedef-native is observed to fail under gcc5 hosts
with multiple definition errors, e.g.:

argp-help.o: In function `argp_fmtstream_write':
argp-help.c:(.text+0x1da0): multiple definition of `argp_fmtstream_write'
argp-fmtstream.o:argp-fmtstream.c:(.text+0x7a0): first defined here

The problem is the change of the default C standard from gnu89 to gnu11
which changes the semantics of 'inline'. The issue is described in the
Porting guide at https://gcc.gnu.org/gcc-5/porting_to.html. Adding the
'-fgnu89-inline' option fixes the issue.

(This fix, including the above explanation, was shamelessly copied from
http://git.vahanus.net/?p=csc/ptxdist-kp.git;a=commit;h=2f04a3587bd33c74ccc9be6e115a8b1fde620841.)

Signed-off-by: Richard Tollerton <rich.tollerton@ni.com>
---
 meta/recipes-core/glibc/cross-localedef-native_2.20.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/recipes-core/glibc/cross-localedef-native_2.20.bb b/meta/recipes-core/glibc/cross-localedef-native_2.20.bb
index ccf56a9..38f2af4 100644
--- a/meta/recipes-core/glibc/cross-localedef-native_2.20.bb
+++ b/meta/recipes-core/glibc/cross-localedef-native_2.20.bb
@@ -39,7 +39,7 @@ SRCREV_localedef = "c833367348d39dad7ba018990bfdaffaec8e9ed3"
 S = "${WORKDIR}/git"
 
 EXTRA_OECONF = "--with-glibc=${S}"
-CFLAGS += "-DNOT_IN_libc=1"
+CFLAGS += "-DNOT_IN_libc=1 -fgnu89-inline"
 
 do_configure () {
 	${S}/localedef/configure ${EXTRA_OECONF}
-- 
2.4.4


