Received: from 93-97-173-237.zone5.bethere.co.uk ([93.97.173.237]
	helo=tim.rpsys.net) by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <richard.purdie@linuxfoundation.org>)
	id 1Shjcw-0003la-PJ for openembedded-core@lists.openembedded.org;
	Thu, 21 Jun 2012 17:48:59 +0200
Received: from localhost (localhost [127.0.0.1])
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id q5LFcDGn023908
	for <openembedded-core@lists.openembedded.org>;
	Thu, 21 Jun 2012 16:38:13 +0100
Received: from tim.rpsys.net ([127.0.0.1])
	by localhost (tim.rpsys.net [127.0.0.1]) (amavisd-new,
	port 10024) with LMTP
	id 22780-10 for <openembedded-core@lists.openembedded.org>;
	Thu, 21 Jun 2012 16:38:09 +0100 (BST)
Received: from [192.168.3.10] ([192.168.3.10]) (authenticated bits=0)
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id q5LFc2bs023901
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-SHA bits=256 verify=NO)
	for <openembedded-core@lists.openembedded.org>;
	Thu, 21 Jun 2012 16:38:05 +0100
Message-ID: <1340293084.1640.128.camel@ted>
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Date: Thu, 21 Jun 2012 16:38:04 +0100
In-Reply-To: <4FDE9912.60406@windriver.com>
References: <cover.1339751573.git.xiaofeng.yan@windriver.com>
	<cf3611bc2fea78d0aa3d042e000edb0e86534297.1339751573.git.xiaofeng.yan@windriver.com>
	<1339772393.7261.6.camel@ted> <4FDE9912.60406@windriver.com>
X-Mailer: Evolution 3.2.2- 
Mime-Version: 1.0
X-Virus-Scanned: amavisd-new at rpsys.net
X-MIME-Autoconverted: from 8bit to quoted-printable by tim.rpsys.net id
	q5LFcDGn023908
Subject: Re: [PATCH 2/3] lsbinitscripts: Remove original /etc/init.d/functions when building an lsb image
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
Reply-To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-core>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Thu, 21 Jun 2012 15:48:59 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, 2012-06-18 at 10:57 +0800, Xiaofeng Yan wrote:
> On 2012=E5=B9=B406=E6=9C=8815=E6=97=A5 22:59, Richard Purdie wrote:
> > On Fri, 2012-06-15 at 17:30 +0800, xiaofeng.yan@windriver.com wrote:
> >> From: Xiaofeng Yan<xiaofeng.yan@windriver.com>
> >>
> >> The linking will fail when an original functions exist. So remove th=
e
> >> original functions when building an lsb image and make functions lin=
king to
> >> functions.lsbinitscripts successfully.
> >>
> >> [YOCTO #2133]
> >>
> >> Signed-off-by: Xiaofeng Yan<xiaofeng.yan@windriver.com>
> >> ---
> >>   meta/recipes-extended/lsb/lsbinitscripts_9.03.bb |    8 +++++++-
> >>   1 file changed, 7 insertions(+), 1 deletion(-)
> >>
> >> diff --git a/meta/recipes-extended/lsb/lsbinitscripts_9.03.bb b/meta=
/recipes-extended/lsb/lsbinitscripts_9.03.bb
> >> index dd92a92..73bea2f 100644
> >> --- a/meta/recipes-extended/lsb/lsbinitscripts_9.03.bb
> >> +++ b/meta/recipes-extended/lsb/lsbinitscripts_9.03.bb
> >> @@ -2,7 +2,7 @@ DESCRIPTION =3D "SysV init scripts which only is use=
d in an LSB image"
> >>   SECTION =3D "base"
> >>   LICENSE =3D "GPLv2"
> >>   DEPENDS =3D "popt"
> >> -PR =3D "r0"
> >> +PR =3D "r1"
> >>
> >>   LIC_FILES_CHKSUM =3D "file://COPYING;md5=3Debf4e8b49780ab187d51bd2=
6aaa022c6"
> >>
> >> @@ -25,3 +25,9 @@ do_install(){
> >>   	install -d ${D}/etc/init.d/
> >>   	install -m 0755 ${S}/rc.d/init.d/functions ${D}/etc/init.d/functi=
ons
> >>   }
> >> +
> >> +pkg_postinst_${PN} () {
> >> +	if [ -f "/etc/init.d/functions" ]; then
> >> +		rm -f /etc/init.d/functions
> >> +	fi
> >> +}
> > This looks highly suspicious to me. Shouldn't the other provider of t=
his
> > be put under control for update-alternatives too or something?
> Thanks for your comments.
> the other provider of this is from initscripts_1.0.bb, installing all o=
f=20
> init-scripts in the stage of installing without using=20
> update-alternatives. So the functions is a file instead of linking mode=
.=20
> An error appear when lsbinicscritps replace initscripts if not removing=
=20
> file functions. So I remove the original functions for making the latte=
r=20
> linking successfully. What is the purpose is for avoiding to modify the=
=20
> other non-lsb bb files. The changes of this will be only in lsb image.

Right, I understand there is a conflict here. Could we not add
update-alternatives support to the initscripts recipe for this file to,
so its a link in both packages and then update-alternatives will take
care of linking the correct one into place?

Cheers,

Richard



