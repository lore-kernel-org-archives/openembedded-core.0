Return-Path: <alex.kanavin@gmail.com>
Received: from mail-ua1-f41.google.com (mail-ua1-f41.google.com
	[209.85.222.41])
	by mail.openembedded.org (Postfix) with ESMTP id 3CAAF7F942
	for <openembedded-core@lists.openembedded.org>;
	Sun, 17 Nov 2019 21:19:43 +0000 (UTC)
Received: by mail-ua1-f41.google.com with SMTP id s25so4603535uap.1
	for <openembedded-core@lists.openembedded.org>;
	Sun, 17 Nov 2019 13:19:44 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc; bh=ISwdR8NHfLq48RteGnr7mzKKGsFRYJ9C9DQb0yjD9fY=;
	b=JkIubHH+0dLZ+4kScLmuRpknXltqEoyfVxyAENwY/cQ9r7TyrkWZ/sYwdbvleYWpaj
	Lx7YWbKMK3yiW1UXj2GXI/mmXtSqmgjq5oe2Ms8rB+TIaffo3qJBxVoVbcUD8igtyM0k
	J14tsNzSui62R+SFQPTI1/yFQ/VMoQCDw3GeZzE1uiHZpfAtjE+nFoZ2k6el0iOPvLmK
	LPMWVYAAD5Cat/3lu1sjcISsoxGm3rQiVapNnQ6KugeT032b4IsEQ6dRL3r8xj488gzt
	mGn34lXN1Ylx+4kAYplevRklI2snFje8B7gluUJCHDq6GAnHkqANBjf/XLdjyadWpqEw
	ixYQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=ISwdR8NHfLq48RteGnr7mzKKGsFRYJ9C9DQb0yjD9fY=;
	b=OiXXxqZ/Tu84qfyWr0miV0eUKKKJCL6rutlesDiq6csPrmTDK6CdVfQNCIpbc2/ecW
	Ltn+w7U8FENHVTw5uuMsaIYDYD1bxPmkTTK0oWLdaG4a9h4z2J/Tx4Lpy2/1zSU/ME4d
	X+3YCtrmLpa0rLrz5YPMmQ/cjaqJZGZ5V2a0LBq69TjGaDXKsdxAOMU+ENqwLP5fvP/s
	DLZXY8dPvdORUvFsQW11eJr2btgIJilAqZUvaCzjgfRSFR/dfH/oxJZ2mIqifQa3mZgs
	Z8PZVJfmQ07VoHTi5fA70l3cSjaG+NQ9Aqm3SFrx7/9jlzjeT68cKVKaEyqq5qBLkZAU
	RIEQ==
X-Gm-Message-State: APjAAAUS6TJdOUiTUhMo3czgCCQqoueWs2mkxm6a4osOh+UASHISTOyT
	EDVaVhME9/OWhLVASNtWjrhf1vZUnj7iOJzeDxd2yA==
X-Google-Smtp-Source: APXvYqwk2eAso/2NBoWw7dRsXwqNhZzmsFwPQpc2z1phtbhzj5C+yXEKCgRctHsa9aOlONPsc5IpfBQiuUuOELD9foY=
X-Received: by 2002:ab0:1c06:: with SMTP id a6mr14965547uaj.93.1574025583885; 
	Sun, 17 Nov 2019 13:19:43 -0800 (PST)
MIME-Version: 1.0
References: <adf92df5-06d4-ea38-ad9f-55dde92148b2@linux.ibm.com>
	<bb5c3045-8131-095a-f7bc-0ff91f36af5a@linux.ibm.com>
In-Reply-To: <bb5c3045-8131-095a-f7bc-0ff91f36af5a@linux.ibm.com>
From: Alexander Kanavin <alex.kanavin@gmail.com>
Date: Sun, 17 Nov 2019 22:19:32 +0100
Message-ID: <CANNYZj8LNhF26TLHuLMPh6K40dXe8V5pgEvv8N3MAEFVy+vveg@mail.gmail.com>
To: Joseph Reynolds <jrey@linux.ibm.com>
Cc: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: How to add build date? (was: ... basehash value changed...)
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
X-List-Received-Date: Sun, 17 Nov 2019 21:19:43 -0000
Content-Type: multipart/alternative; boundary="000000000000cb82270597916337"

--000000000000cb82270597916337
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

I'd write the date into the file at image creation, via
ROOTFS_POSTPROCESS_COMMAND.

Having it in a recipe means that you either force the recipe to not be a
part of sstate cache, always rebuilding it and its dependencies (bad idea),
or accept that the date comes from a previously built cache object, which
means it will mismatch the actual image creation date.

A bit of context would help: why would you want that info in os-release?
Who would use that information and how?

Alex

On Sat, 16 Nov 2019 at 23:14, Joseph Reynolds <jrey@linux.ibm.com> wrote:

>
> Is there a best practice for folks who want to put the build date into
> their generated os-release file?  I've seen this question come up at
> least 3 times in my brief involvement with OE.  I could perhaps add
> comment to the OpenBMC os-release.bbappend file to provide the proper
> guidance.  I would like to hear your ideas.
>
> - Joseph
>
>
> -------- Forwarded Message --------
> Subject:        Re: how to solve the error that basehash value changed
> from
> 'xxx' to 'aaaa' ?
> Date:   Sat, 16 Nov 2019 15:50:38 -0600
> From:   Joseph Reynolds <jrey@linux.ibm.com>
> To:     www <ouyangxuan10@163.com>, openbmc@lists.ozlabs.org
> <openbmc@lists.ozlabs.org>
>
>
>
> Byron,
>
> What modification did you put into the os-release recipe?  It would help
> us help you if you put that in your email.
>
>
> Are you adding the build date to the generated os-release file? If so,
> be aware that might cause the issues with the shared state cache you are
> experiencing.  Also be aware this practice wrecks reproducible builds.
>
> A better way to get the same effect might be to create a git tag with
> the information you want to appear in the generated os-release file.
> When you buld with this tag is then picked up by the OpenBMC
> meta-phosphor os-release.bbappend (via `git describe`) and included in
> the genersted os-release file as the BUILD_ID. See:
>
> https://github.com/ibm-openbmc/openbmc/blob/d1c59b7a36c10c18838c07af10b18=
080174cd61d/meta-phosphor/recipes-core/os-release/os-release.bbappend
> (But I have not tried that.)
>
> A way to work around the hash change is to add a line to your recipe
> like: PR[vardepsxeclude]=3D"DATETIME"
> As suggested by:
> https://forums.openpli.org/topic/41447-how-to-get-rid-of-taskhash-mismatc=
h/
>
>
> My apologies for top posting -- my email reader was not quoting the
> message properly, so I cut/pasted it below.
>
> - Joseph
>
>
> On 11/13/19 1:38 AM, www wrote:
>
> When I modify the os-release file in my yocto project, it appear some
> error, and how can I solve it ? Who can give me some help or advice?
> Thank you=EF=BC=81
> I execute the recommended command on the console and it didn't work.
>
> ERROR: os-release-1.0-r0 do_compile: Taskhash mismatch
> ce133f0458608e03aa55224df28156e523e54903115efbbcd62946f84a867201 versus
> 7269881f0eb1759ed420a2db4c04fb477cd8c1288bc5f82df5c8161bb926ea1f
>
> for  /home/temp/xxx/wsp/obmc-source/entity_xxx/meta/recipes-core/os-relea=
se/os-release.bb.do_compile
> ERROR: Taskhash mismatch
> ce133f0458608e03aa55224df28156e523e54903115efbbcd62946f84a867201 versus
> 7269881f0eb1759ed420a2db4c04fb477cd8c1288bc5f82df5c8161bb926ea1f
>
> for /home/temp/xxx/wsp/obmc-source/entity_xxx/meta/recipes-core/os-releas=
e/os-release.bb.do_compile
> ERROR: When reparsing
> /home/temp/xxx/wsp/obmc-source/entity_xxx/meta/recipes-core/os-release/os=
-release.bb.do_compile, the
>
> basehash value changed from
> 99a42a1a3b1a151de604267b159558ecaf1031a3bec8917df132c81302e729a5 to
> 4f3288a8763e2e1af78e4b3cdd9c0c0ccb3b0d5c78a3073c188b22200df2a9b0. The
> metadata is not deterministic and this needs to be fixed.
> ERROR: The following commands may help:
> ERROR: $ bitbake os-release -cdo_compile -Snone
> ERROR: Then:
> ERROR: $ bitbake os-release -cdo_compile -Sprintdiff
>
> ERROR: When
> reparsing /home/temp/xxx/wsp/obmc-source/entity_xxx/meta/recipes-core/os-=
release/os-release.bb.do_compile, the
>
> basehash value changed from
> 99a42a1a3b1a151de604267b159558ecaf1031a3bec8917df132c81302e729a5 to
> 47c30012daa6aa77be09a93fe21e66995361ef26b4487111005617db8cb4de59. The
> metadata is not deterministic and this needs to be fixed.
> ERROR: The following commands may help:
> ERROR: $ bitbake os-release -cdo_compile -Snone
> ERROR: Then:
> ERROR: $ bitbake os-release -cdo_compile -Sprintdiff
>
> thanks,
> Byron
>
> --
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-core
>

--000000000000cb82270597916337
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div>I&#39;d write the date into the file at image creatio=
n, via ROOTFS_POSTPROCESS_COMMAND.</div><div><br></div><div>Having it in a =
recipe means that you either force the recipe to not be a part of sstate ca=
che, always rebuilding it and its dependencies (bad idea), or accept that t=
he date comes from a previously built cache object, which means it will mis=
match the actual image creation date.</div><div><br></div><div>A bit of con=
text would help: why would you want that info in os-release? Who would use =
that information and how?<br></div><div><br></div><div>Alex<br></div></div>=
<br><div class=3D"gmail_quote"><div dir=3D"ltr" class=3D"gmail_attr">On Sat=
, 16 Nov 2019 at 23:14, Joseph Reynolds &lt;<a href=3D"mailto:jrey@linux.ib=
m.com">jrey@linux.ibm.com</a>&gt; wrote:<br></div><blockquote class=3D"gmai=
l_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,20=
4,204);padding-left:1ex"><br>
Is there a best practice for folks who want to put the build date into <br>
their generated os-release file?=C2=A0 I&#39;ve seen this question come up =
at <br>
least 3 times in my brief involvement with OE.=C2=A0 I could perhaps add <b=
r>
comment to the OpenBMC os-release.bbappend file to provide the proper <br>
guidance.=C2=A0 I would like to hear your ideas.<br>
<br>
- Joseph<br>
<br>
<br>
-------- Forwarded Message --------<br>
Subject:=C2=A0 =C2=A0 =C2=A0 =C2=A0 Re: how to solve the error that basehas=
h value changed from <br>
&#39;xxx&#39; to &#39;aaaa&#39; ?<br>
Date:=C2=A0 =C2=A0Sat, 16 Nov 2019 15:50:38 -0600<br>
From:=C2=A0 =C2=A0Joseph Reynolds &lt;<a href=3D"mailto:jrey@linux.ibm.com"=
 target=3D"_blank">jrey@linux.ibm.com</a>&gt;<br>
To:=C2=A0 =C2=A0 =C2=A0www &lt;<a href=3D"mailto:ouyangxuan10@163.com" targ=
et=3D"_blank">ouyangxuan10@163.com</a>&gt;, <a href=3D"mailto:openbmc@lists=
.ozlabs.org" target=3D"_blank">openbmc@lists.ozlabs.org</a> <br>
&lt;<a href=3D"mailto:openbmc@lists.ozlabs.org" target=3D"_blank">openbmc@l=
ists.ozlabs.org</a>&gt;<br>
<br>
<br>
<br>
Byron,<br>
<br>
What modification did you put into the os-release recipe?=C2=A0 It would he=
lp <br>
us help you if you put that in your email.<br>
<br>
<br>
Are you adding the build date to the generated os-release file? If so, <br>
be aware that might cause the issues with the shared state cache you are <b=
r>
experiencing.=C2=A0 Also be aware this practice wrecks reproducible builds.=
<br>
<br>
A better way to get the same effect might be to create a git tag with <br>
the information you want to appear in the generated os-release file.=C2=A0 =
<br>
When you buld with this tag is then picked up by the OpenBMC <br>
meta-phosphor os-release.bbappend (via `git describe`) and included in <br>
the genersted os-release file as the BUILD_ID. See:<br>
<a href=3D"https://github.com/ibm-openbmc/openbmc/blob/d1c59b7a36c10c18838c=
07af10b18080174cd61d/meta-phosphor/recipes-core/os-release/os-release.bbapp=
end" rel=3D"noreferrer" target=3D"_blank">https://github.com/ibm-openbmc/op=
enbmc/blob/d1c59b7a36c10c18838c07af10b18080174cd61d/meta-phosphor/recipes-c=
ore/os-release/os-release.bbappend</a><br>
(But I have not tried that.)<br>
<br>
A way to work around the hash change is to add a line to your recipe <br>
like: PR[vardepsxeclude]=3D&quot;DATETIME&quot;<br>
As suggested by: <br>
<a href=3D"https://forums.openpli.org/topic/41447-how-to-get-rid-of-taskhas=
h-mismatch/" rel=3D"noreferrer" target=3D"_blank">https://forums.openpli.or=
g/topic/41447-how-to-get-rid-of-taskhash-mismatch/</a><br>
<br>
<br>
My apologies for top posting -- my email reader was not quoting the <br>
message properly, so I cut/pasted it below.<br>
<br>
- Joseph<br>
<br>
<br>
On 11/13/19 1:38 AM, www wrote:<br>
<br>
When I modify the os-release file in my yocto project, it appear some <br>
error, and how can I solve it ?=C2=A0Who can give me some help or advice? <=
br>
Thank you=EF=BC=81<br>
I execute the recommended command on the console and it didn&#39;t work.<br=
>
<br>
ERROR: os-release-1.0-r0 do_compile: Taskhash mismatch <br>
ce133f0458608e03aa55224df28156e523e54903115efbbcd62946f84a867201 versus <br=
>
7269881f0eb1759ed420a2db4c04fb477cd8c1288bc5f82df5c8161bb926ea1f <br>
for=C2=A0=C2=A0/home/temp/xxx/wsp/obmc-source/entity_xxx/meta/recipes-core/=
os-release/os-release.bb.do_compile<br>
ERROR: Taskhash mismatch <br>
ce133f0458608e03aa55224df28156e523e54903115efbbcd62946f84a867201 versus <br=
>
7269881f0eb1759ed420a2db4c04fb477cd8c1288bc5f82df5c8161bb926ea1f <br>
for=C2=A0/home/temp/xxx/wsp/obmc-source/entity_xxx/meta/recipes-core/os-rel=
ease/os-release.bb.do_compile<br>
ERROR: When reparsing <br>
/home/temp/xxx/wsp/obmc-source/entity_xxx/meta/recipes-core/os-release/os-r=
elease.bb.do_compile,=C2=A0the <br>
basehash value changed from <br>
99a42a1a3b1a151de604267b159558ecaf1031a3bec8917df132c81302e729a5 to <br>
4f3288a8763e2e1af78e4b3cdd9c0c0ccb3b0d5c78a3073c188b22200df2a9b0.=C2=A0The =
<br>
metadata is not deterministic and this needs to be fixed.<br>
ERROR: The following commands may help:<br>
ERROR: $ bitbake os-release -cdo_compile -Snone<br>
ERROR: Then:<br>
ERROR: $ bitbake os-release -cdo_compile -Sprintdiff<br>
<br>
ERROR: When <br>
reparsing=C2=A0/home/temp/xxx/wsp/obmc-source/entity_xxx/meta/recipes-core/=
os-release/os-release.bb.do_compile,=C2=A0the <br>
basehash value changed from <br>
99a42a1a3b1a151de604267b159558ecaf1031a3bec8917df132c81302e729a5 to <br>
47c30012daa6aa77be09a93fe21e66995361ef26b4487111005617db8cb4de59. The <br>
metadata is not deterministic and this needs to be fixed.<br>
ERROR: The following commands may help:<br>
ERROR: $ bitbake os-release -cdo_compile -Snone<br>
ERROR: Then:<br>
ERROR: $ bitbake os-release -cdo_compile -Sprintdiff<br>
<br>
thanks,<br>
Byron<br>
<br>
-- <br>
_______________________________________________<br>
Openembedded-core mailing list<br>
<a href=3D"mailto:Openembedded-core@lists.openembedded.org" target=3D"_blan=
k">Openembedded-core@lists.openembedded.org</a><br>
<a href=3D"http://lists.openembedded.org/mailman/listinfo/openembedded-core=
" rel=3D"noreferrer" target=3D"_blank">http://lists.openembedded.org/mailma=
n/listinfo/openembedded-core</a><br>
</blockquote></div>

--000000000000cb82270597916337--
