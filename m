Return-Path: <Ming.Liu@windriver.com>
Received: from mail.windriver.com (mail.windriver.com [147.11.1.11])
	by mail.openembedded.org (Postfix) with ESMTP id E5B156CF24
	for <openembedded-core@lists.openembedded.org>;
	Tue, 22 Oct 2013 02:12:36 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail.windriver.com (8.14.5/8.14.3) with ESMTP id r9M2Cavj029840
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL);
	Mon, 21 Oct 2013 19:12:36 -0700 (PDT)
Received: from [128.224.162.145] (128.224.162.145) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server (TLS) id 14.2.347.0;
	Mon, 21 Oct 2013 19:12:35 -0700
Message-ID: <5265DF10.2020106@windriver.com>
Date: Tue, 22 Oct 2013 10:12:32 +0800
From: Ming Liu <ming.liu@windriver.com>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:17.0) Gecko/20130330 Thunderbird/17.0.5
MIME-Version: 1.0
To: Khem Raj <raj.khem@gmail.com>
References: <1382256149-14223-1-git-send-email-ming.liu@windriver.com>
	<1382256149-14223-3-git-send-email-ming.liu@windriver.com>
	<CAMKF1srMtfiN_dNRhnY8=cmTexkMpYFVHunnCr49ULvqdCdWdA@mail.gmail.com>
In-Reply-To: <CAMKF1srMtfiN_dNRhnY8=cmTexkMpYFVHunnCr49ULvqdCdWdA@mail.gmail.com>
X-Originating-IP: [128.224.162.145]
Cc: "openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH V4 3/3] screen: dynamically add or remove a entry to/from /etc/shells
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
X-List-Received-Date: Tue, 22 Oct 2013 02:12:37 -0000
Content-Type: multipart/alternative;
	boundary="------------060704020102060307060905"

--------------060704020102060307060905
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit

On 10/22/2013 06:32 AM, Khem Raj wrote:
>
>
> On Sunday, October 20, 2013, Ming Liu <ming.liu@windriver.com 
> <mailto:ming.liu@windriver.com>> wrote:
> > 1 Add base-files to RDEPENDS.
> > 2 Add pkg_postinst and pkg_postrm to add and remove a entry in
> > /etc/shells.
> >
>
> will it affect upgradability of the package which is providing 
> /etc/shells ?
Yes, you are right, it will. So we need put /etc/shells to CONFFILES in 
base-files package.

//Ming Liu

>
> > Signed-off-by: Ming Liu <ming.liu@windriver.com 
> <mailto:ming.liu@windriver.com>>
> > ---
> >  meta/recipes-extended/screen/screen_4.0.3.bb 
> <http://screen_4.0.3.bb> | 10 ++++++++++
> >  1 file changed, 10 insertions(+)
> >
> > diff --git a/meta/recipes-extended/screen/screen_4.0.3.bb 
> <http://screen_4.0.3.bb> 
> b/meta/recipes-extended/screen/screen_4.0.3.bb <http://screen_4.0.3.bb>
> > index 1a7eb20..be42fb9 100644
> > --- a/meta/recipes-extended/screen/screen_4.0.3.bb 
> <http://screen_4.0.3.bb>
> > +++ b/meta/recipes-extended/screen/screen_4.0.3.bb 
> <http://screen_4.0.3.bb>
> > @@ -12,6 +12,8 @@ LIC_FILES_CHKSUM = 
> "file://COPYING;md5=0774d66808b0f602e94448108f59448b \
> >  SECTION = "console/utils"
> >  DEPENDS = "ncurses \
> >            ${@base_contains('DISTRO_FEATURES', 'pam', 'libpam', '', d)}"
> > +RDEPENDS_${PN} = "base-files"
> > +
> >  PR = "r3"
> >
> >  SRC_URI = "${GNU_MIRROR}/screen/screen-${PV}.tar.gz;name=tarball \
> > @@ -41,3 +43,11 @@ do_install_append () {
> >                 fi
> >         done
> >  }
> > +
> > +pkg_postinst_${PN} () {
> > +       grep -q "^${bindir}/screen$" $D${sysconfdir}/shells || echo 
> ${bindir}/screen >> $D${sysconfdir}/shells
> > +}
> > +
> > +pkg_postrm_${PN} () {
> > +       printf "$(grep -v "^${bindir}/screen$" 
> $D${sysconfdir}/shells)\n" > $D${sysconfdir}/shells
> > +}
> > --
> > 1.8.4.1
> >
> > _______________________________________________
> > Openembedded-core mailing list
> > Openembedded-core@lists.openembedded.org 
> <mailto:Openembedded-core@lists.openembedded.org>
> > http://lists.openembedded.org/mailman/listinfo/openembedded-core
> > 


--------------060704020102060307060905
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: 8bit

<html>
  <head>
    <meta content="text/html; charset=UTF-8" http-equiv="Content-Type">
  </head>
  <body text="#000000" bgcolor="#FFFFFF">
    <div class="moz-cite-prefix">On 10/22/2013 06:32 AM, Khem Raj wrote:<br>
    </div>
    <blockquote
cite="mid:CAMKF1srMtfiN_dNRhnY8=cmTexkMpYFVHunnCr49ULvqdCdWdA@mail.gmail.com"
      type="cite">
      <meta http-equiv="Context-Type" content="text/html; charset=UTF-8">
      <br>
      <br>
      On Sunday, October 20, 2013, Ming Liu &lt;<a
        moz-do-not-send="true" href="mailto:ming.liu@windriver.com">ming.liu@windriver.com</a>&gt;
      wrote:<br>
      &gt; 1 Add base-files to RDEPENDS.<br>
      &gt; 2 Add pkg_postinst and pkg_postrm to add and remove a entry
      in<br>
      &gt; /etc/shells.<br>
      &gt;<br>
      <br>
      will it affect upgradability of the package which is providing
      /etc/shells ?<br>
    </blockquote>
    Yes, you are right, it will. So we need put /etc/shells to CONFFILES
    in base-files package.<br>
    <br>
    //Ming Liu<br>
    <br>
    <blockquote
cite="mid:CAMKF1srMtfiN_dNRhnY8=cmTexkMpYFVHunnCr49ULvqdCdWdA@mail.gmail.com"
      type="cite"><br>
      &gt; Signed-off-by: Ming Liu &lt;<a moz-do-not-send="true"
        href="mailto:ming.liu@windriver.com">ming.liu@windriver.com</a>&gt;<br>
      &gt; ---<br>
      &gt;  meta/recipes-extended/screen/<a moz-do-not-send="true"
        href="http://screen_4.0.3.bb">screen_4.0.3.bb</a> | 10
      ++++++++++<br>
      &gt;  1 file changed, 10 insertions(+)<br>
      &gt;<br>
      &gt; diff --git a/meta/recipes-extended/screen/<a
        moz-do-not-send="true" href="http://screen_4.0.3.bb">screen_4.0.3.bb</a>
      b/meta/recipes-extended/screen/<a moz-do-not-send="true"
        href="http://screen_4.0.3.bb">screen_4.0.3.bb</a><br>
      &gt; index 1a7eb20..be42fb9 100644<br>
      &gt; --- a/meta/recipes-extended/screen/<a moz-do-not-send="true"
        href="http://screen_4.0.3.bb">screen_4.0.3.bb</a><br>
      &gt; +++ b/meta/recipes-extended/screen/<a moz-do-not-send="true"
        href="http://screen_4.0.3.bb">screen_4.0.3.bb</a><br>
      &gt; @@ -12,6 +12,8 @@ LIC_FILES_CHKSUM =
      "<a class="moz-txt-link-freetext" href="file://COPYING;md5=0774d66808b0f602e94448108f59448b">file://COPYING;md5=0774d66808b0f602e94448108f59448b</a> \<br>
      &gt;  SECTION = "console/utils"<br>
      &gt;  DEPENDS = "ncurses \<br>
      &gt;            ${@base_contains('DISTRO_FEATURES', 'pam',
      'libpam', '', d)}"<br>
      &gt; +RDEPENDS_${PN} = "base-files"<br>
      &gt; +<br>
      &gt;  PR = "r3"<br>
      &gt;<br>
      &gt;  SRC_URI =
      "${GNU_MIRROR}/screen/screen-${PV}.tar.gz;name=tarball \<br>
      &gt; @@ -41,3 +43,11 @@ do_install_append () {<br>
      &gt;                 fi<br>
      &gt;         done<br>
      &gt;  }<br>
      &gt; +<br>
      &gt; +pkg_postinst_${PN} () {<br>
      &gt; +       grep -q "^${bindir}/screen$" $D${sysconfdir}/shells
      || echo ${bindir}/screen &gt;&gt; $D${sysconfdir}/shells<br>
      &gt; +}<br>
      &gt; +<br>
      &gt; +pkg_postrm_${PN} () {<br>
      &gt; +       printf "$(grep -v "^${bindir}/screen$"
      $D${sysconfdir}/shells)\n" &gt; $D${sysconfdir}/shells<br>
      &gt; +}<br>
      &gt; --<br>
      &gt; 1.8.4.1<br>
      &gt;<br>
      &gt; _______________________________________________<br>
      &gt; Openembedded-core mailing list<br>
      &gt; <a moz-do-not-send="true"
        href="mailto:Openembedded-core@lists.openembedded.org">Openembedded-core@lists.openembedded.org</a><br>
      &gt; <a moz-do-not-send="true"
        href="http://lists.openembedded.org/mailman/listinfo/openembedded-core">http://lists.openembedded.org/mailman/listinfo/openembedded-core</a><br>
      &gt;
    </blockquote>
    <br>
  </body>
</html>

--------------060704020102060307060905--
