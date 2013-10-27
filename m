Return-Path: <jacob.kroon@gmail.com>
Received: from mail-la0-f41.google.com (mail-la0-f41.google.com
	[209.85.215.41])
	by mail.openembedded.org (Postfix) with ESMTP id 06DF66D0F0
	for <openembedded-core@lists.openembedded.org>;
	Sun, 27 Oct 2013 07:25:33 +0000 (UTC)
Received: by mail-la0-f41.google.com with SMTP id el20so4305290lab.14
	for <openembedded-core@lists.openembedded.org>;
	Sun, 27 Oct 2013 00:25:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:cc:content-type;
	bh=CUuw72UHdvie/igF+TVUkYmmYKgZW1+1mTTh6Wq4g8k=;
	b=kO3Gs2rbXF4CkzyMTJXltW8Pberr/LOD0w/cM93pUuju84ZOiDQWN4FfmtHKUBon+5
	ssEs1ihuTcLWlXLC56DWJNQoEnCxGeCJhE4OpjQC0HkRJdRso7lc0N5MSYT3cuC1YhCj
	VQQa3y/X01u6mE+9YAEINrYnroWDoiIVhvE60E1/RH93zfobrZHen7fLnB3DDiUrPlKt
	iYNhdY/D7K9UF37zbGIaVEGKyjpvCfdv7PLbIvxOxd2pBQMQLoLIkJRtiwfc3k0B/ix1
	XwqesWZDUWBso9fqlRIiFDNMVHWLPxB1tJ+uOa2FfOBpkHPVHIO1Zyx6Ew9g3xyEDv2w
	PsDg==
MIME-Version: 1.0
X-Received: by 10.152.9.2 with SMTP id v2mr403917laa.40.1382858734816; Sun, 27
	Oct 2013 00:25:34 -0700 (PDT)
Received: by 10.112.13.7 with HTTP; Sun, 27 Oct 2013 00:25:34 -0700 (PDT)
In-Reply-To: <526CBE56.8010406@gmail.com>
References: <1382827017-724-1-git-send-email-jacob.kroon@gmail.com>
	<526CBE56.8010406@gmail.com>
Date: Sun, 27 Oct 2013 08:25:34 +0100
Message-ID: <CAPbeDC=LTDOjrpP0XHXcAJVVtmVBZ9tiLm9iJ_MvXFypa0uWMg@mail.gmail.com>
From: Jacob Kroon <jacob.kroon@gmail.com>
To: Hans Beckerus <hans.beckerus@gmail.com>
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH] update-rc.d.bbclass: Fix host/target test in postinst
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
X-List-Received-Date: Sun, 27 Oct 2013 07:25:35 -0000
Content-Type: multipart/alternative; boundary=089e0158b8eea9d56c04e9b3e306

--089e0158b8eea9d56c04e9b3e306
Content-Type: text/plain; charset=ISO-8859-1

Hi Hans,
I'm far from being a scripting-expert, so I just did what I could in order
to get rid of the warning and stop the service.
Sending this patch was just a way to raise some attention to the bug and
get some discussion going :-)
If there are other ways one should proceed instead of sending "broken"
patches to the mailing list I will do so in the future.
Regards
Jacob


On Sun, Oct 27, 2013 at 8:18 AM, Hans Beckerus <hans.beckerus@gmail.com>wrote:

> On 2013-10-27 12:36, Jacob Kroon wrote:
> > When running the postinst script I get a shell warning:
> >
> > sh: argument expected
> >
> > and the service is never stopped. This patch fixes the warning
> > message and stops the service.
> This patch does not look right to me?
> If length of $(D) is zero the condition will *always* be true. Instead of
> actually testing the existence of "${INIT_D_DIR}/${INITSCRIPT_NAME}" it is
> now simply converted to a string. What did I miss ;)
>
> Thanks.
> Hans
>
> > Signed-off-by: Jacob Kroon <jacob.kroon@gmail.com>
> > ---
> >  meta/classes/update-rc.d.bbclass | 2 +-
> >  1 file changed, 1 insertion(+), 1 deletion(-)
> >
> > diff --git a/meta/classes/update-rc.d.bbclass
> b/meta/classes/update-rc.d.bbclass
> > index e14659d..835b717 100644
> > --- a/meta/classes/update-rc.d.bbclass
> > +++ b/meta/classes/update-rc.d.bbclass
> > @@ -16,7 +16,7 @@ updatercd_postinst() {
> >  # test if there is a previous init script there, ie, we are updating
> the package
> >  # if so, we stop the service and remove it before we install from the
> new package
> >  if type update-rc.d >/dev/null 2>/dev/null; then
> > -     if [ -z "$D" -a `test -f "${INIT_D_DIR}/${INITSCRIPT_NAME}"` ];
> then
> > +     if [ -z "$D" -a "test -f ${INIT_D_DIR}/${INITSCRIPT_NAME}" ]; then
> >               ${INIT_D_DIR}/${INITSCRIPT_NAME} stop
> >       fi
> >       if [ -n "$D" ]; then
>
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-core
>



-- 
  -- Jacob

--089e0158b8eea9d56c04e9b3e306
Content-Type: text/html; charset=ISO-8859-1
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div><div><div><div><div><div>Hi Hans,<br></div>I&#39;m fa=
r from being a scripting-expert, so I just did what I could in order to get=
 rid of the warning and stop the service.<br></div>Sending this patch was j=
ust a way to raise some attention to the bug and get some discussion going =
:-)<br>
</div>If there are other ways one should proceed instead of sending &quot;b=
roken&quot; patches to the mailing list I will do so in the future.<br></di=
v></div>Regards<br></div>Jacob<br></div><div class=3D"gmail_extra"><br><br>
<div class=3D"gmail_quote">On Sun, Oct 27, 2013 at 8:18 AM, Hans Beckerus <=
span dir=3D"ltr">&lt;<a href=3D"mailto:hans.beckerus@gmail.com" target=3D"_=
blank">hans.beckerus@gmail.com</a>&gt;</span> wrote:<br><blockquote class=
=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;border-left:1px #ccc solid;padd=
ing-left:1ex">
<div class=3D"im">On 2013-10-27 12:36, Jacob Kroon wrote:<br>
&gt; When running the postinst script I get a shell warning:<br>
&gt;<br>
&gt; sh: argument expected<br>
&gt;<br>
&gt; and the service is never stopped. This patch fixes the warning<br>
&gt; message and stops the service.<br>
</div>This patch does not look right to me?<br>
If length of $(D) is zero the condition will *always* be true. Instead of a=
ctually testing the existence of &quot;${INIT_D_DIR}/${INITSCRIPT_NAME}&quo=
t; it is now simply converted to a string. What did I miss ;)<br>
<br>
Thanks.<br>
Hans<br>
<div class=3D"im"><br>
&gt; Signed-off-by: Jacob Kroon &lt;<a href=3D"mailto:jacob.kroon@gmail.com=
">jacob.kroon@gmail.com</a>&gt;<br>
&gt; ---<br>
&gt; =A0meta/classes/update-rc.d.bbclass | 2 +-<br>
&gt; =A01 file changed, 1 insertion(+), 1 deletion(-)<br>
&gt;<br>
&gt; diff --git a/meta/classes/update-rc.d.bbclass b/meta/classes/update-rc=
.d.bbclass<br>
&gt; index e14659d..835b717 100644<br>
&gt; --- a/meta/classes/update-rc.d.bbclass<br>
&gt; +++ b/meta/classes/update-rc.d.bbclass<br>
&gt; @@ -16,7 +16,7 @@ updatercd_postinst() {<br>
&gt; =A0# test if there is a previous init script there, ie, we are updatin=
g the package<br>
&gt; =A0# if so, we stop the service and remove it before we install from t=
he new package<br>
&gt; =A0if type update-rc.d &gt;/dev/null 2&gt;/dev/null; then<br>
&gt; - =A0 =A0 if [ -z &quot;$D&quot; -a `test -f &quot;${INIT_D_DIR}/${INI=
TSCRIPT_NAME}&quot;` ]; then<br>
&gt; + =A0 =A0 if [ -z &quot;$D&quot; -a &quot;test -f ${INIT_D_DIR}/${INIT=
SCRIPT_NAME}&quot; ]; then<br>
&gt; =A0 =A0 =A0 =A0 =A0 =A0 =A0 ${INIT_D_DIR}/${INITSCRIPT_NAME} stop<br>
&gt; =A0 =A0 =A0 fi<br>
&gt; =A0 =A0 =A0 if [ -n &quot;$D&quot; ]; then<br>
<br>
</div>_______________________________________________<br>
Openembedded-core mailing list<br>
<a href=3D"mailto:Openembedded-core@lists.openembedded.org">Openembedded-co=
re@lists.openembedded.org</a><br>
<a href=3D"http://lists.openembedded.org/mailman/listinfo/openembedded-core=
" target=3D"_blank">http://lists.openembedded.org/mailman/listinfo/openembe=
dded-core</a><br>
</blockquote></div><br><br clear=3D"all"><br>-- <br>=A0 -- Jacob
</div>

--089e0158b8eea9d56c04e9b3e306--
