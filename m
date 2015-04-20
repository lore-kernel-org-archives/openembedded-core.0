Return-Path: <richard.purdie@linuxfoundation.org>
Received: from dan.rpsys.net (5751f4a1.skybroadband.com [87.81.244.161])
	by mail.openembedded.org (Postfix) with ESMTP id 408E2735FA
	for <openembedded-core@lists.openembedded.org>;
	Mon, 20 Apr 2015 15:15:31 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by dan.rpsys.net (8.14.4/8.14.4/Debian-4.1ubuntu1) with ESMTP id
	t3KFFP43011499; Mon, 20 Apr 2015 16:15:25 +0100
Received: from dan.rpsys.net ([127.0.0.1])
	by localhost (dan.rpsys.net [127.0.0.1]) (amavisd-new, port 10024)
	with LMTP id MCADa6kv30ME; Mon, 20 Apr 2015 16:15:25 +0100 (BST)
Received: from [192.168.3.10] ([192.168.3.10]) (authenticated bits=0)
	by dan.rpsys.net (8.14.4/8.14.4/Debian-4.1ubuntu1) with ESMTP id
	t3KFFAcv011495
	(version=TLSv1/SSLv3 cipher=AES128-GCM-SHA256 bits=128 verify=NOT);
	Mon, 20 Apr 2015 16:15:21 +0100
Message-ID: <1429542910.26983.13.camel@linuxfoundation.org>
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Junling Zheng <zhengjunling@huawei.com>
Date: Mon, 20 Apr 2015 16:15:10 +0100
In-Reply-To: <553456B2.8090004@huawei.com>
References: <1429260608-3505-1-git-send-email-zhengjunling@huawei.com>
	<CAJ86T=VcRP1Fxc2+yb12K33TKqssuChAwHTAKjtAWyeMmqMrew@mail.gmail.com>
	<553456B2.8090004@huawei.com>
X-Mailer: Evolution 3.12.10-0ubuntu1~14.10.1 
Mime-Version: 1.0
Cc: OE Core mailing list <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] gmp: remove referencing paths from the build host
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
X-List-Received-Date: Mon, 20 Apr 2015 15:15:33 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Mon, 2015-04-20 at 09:30 +0800, Junling Zheng wrote:
> On 2015/4/18 2:24, Andre McCurdy wrote:
> > On Fri, Apr 17, 2015 at 1:50 AM, Junling Zheng <zhengjunling@huawei.com> wrote:
> >> Currently ${D}${includedir}/gmp.h references the path of build host
> >> incorrectly, remove it.
> >>
> >> Signed-off-by: Junling Zheng <zhengjunling@huawei.com>
> >> ---
> >>  meta/recipes-support/gmp/gmp.inc | 4 ++++
> >>  1 file changed, 4 insertions(+)
> >>
> >> diff --git a/meta/recipes-support/gmp/gmp.inc b/meta/recipes-support/gmp/gmp.inc
> >> index 558ee06..a80b356 100644
> >> --- a/meta/recipes-support/gmp/gmp.inc
> >> +++ b/meta/recipes-support/gmp/gmp.inc
> >> @@ -26,4 +26,8 @@ EXTRA_OECONF += " --enable-cxx=detect"
> >>  PACKAGES =+ "libgmpxx"
> >>  FILES_libgmpxx = "${libdir}/libgmpxx${SOLIBS}"
> >>
> >> +do_install_append_class-target() {
> >> +       sed -i "s+--sysroot=${STAGING_DIR_HOST}++g" ${D}${includedir}/gmp.h
> >> +}
> > 
> > It's possible that STAGING_DIR_HOST could contain '+' characters, so
> > '|' would be a safer sed separator to use here.
> > 
> 
> Ok, thanks for your suggestion:)

I fixed this one whilst merging it (faster than dropping and re-adding).

Cheers,

Richard


