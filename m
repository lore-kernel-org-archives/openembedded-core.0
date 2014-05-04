Return-Path: <tylerwhall@gmail.com>
Received: from mail-qa0-f43.google.com (mail-qa0-f43.google.com
	[209.85.216.43])
	by mail.openembedded.org (Postfix) with ESMTP id A83116028A
	for <openembedded-core@lists.openembedded.org>;
	Sun,  4 May 2014 21:53:06 +0000 (UTC)
Received: by mail-qa0-f43.google.com with SMTP id m5so3150433qaj.30
	for <openembedded-core@lists.openembedded.org>;
	Sun, 04 May 2014 14:53:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc:content-type;
	bh=8vAmSXdq4fORe0SkB06domk4MNk8bdj98pcpfzjvFsk=;
	b=Jk9NMLHU6x76ABmhKDzVOJjqD+dq7oPWPh34F7wCLU8xKs3INk6grz4K4VoK/J/nXH
	BQf8SxiEMVSzdhkurZSeo9pvoudYhpFiFYEfU/FXtZi302Txk8i6FqWVM0/Q/BdWeV2P
	0SZt72RuFiWP2iGVcH6aglJK9hXfNnYV+DNz8YfELsNlxBGO7LTlaUpP/pYgJtGu3Xoa
	e01SpzZxpfE/OGZ6DWuJUzwKNrN624tgsjEyC/jkN2ZD8jW18MGTf91VFts/IjhKn9vZ
	FpiTAcFWX6ObajrctB6RcCZ6S8wCpJ3aoFsHwN+pyHeNM3Vy/EkS/4YDqQyu1E5muuiw
	rfQA==
X-Received: by 10.229.220.197 with SMTP id hz5mr35924254qcb.9.1399240387732;
	Sun, 04 May 2014 14:53:07 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.140.47.120 with HTTP; Sun, 4 May 2014 14:52:47 -0700 (PDT)
In-Reply-To: <5366A8B5.6020900@ti.com>
References: <5366A8B5.6020900@ti.com>
From: Tyler Hall <tylerwhall@gmail.com>
Date: Sun, 4 May 2014 17:52:47 -0400
Message-ID: <CAOjnSCb-Fkxs3J_5eycnQ6gpRaoJpbsdP6H9+UVEHRm6kwbd8g@mail.gmail.com>
To: Joel Fernandes <joelf@ti.com>
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: Quick question about OE-core/bitbake's re-building
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
X-List-Received-Date: Sun, 04 May 2014 21:53:11 -0000
Content-Type: multipart/alternative; boundary=001a11346f6a44297004f89a0a65

--001a11346f6a44297004f89a0a65
Content-Type: text/plain; charset=UTF-8

On Sun, May 4, 2014 at 4:53 PM, Joel Fernandes <joelf@ti.com> wrote:

> How does it figure out when it needs to rebuild a package?
>

Bitbake generates hashes for every task that are based on the data that
will be used when running the task. This includes the body of the task
function, any variables it references, checksums of required files, and
hashes of tasks it depends on. This data is stored for each task in
$BUILDDIR/tmp/stamps. The task will re-run if a matching sigdata file does
not exist in the stamps directory. You can run bitbake-dumpsig on a sigdata
file to see what metadata changes will cause the task to rebuild.

For example if I modify the file:
>  ../meta/recipes-core/systemd/systemd-serialgetty/serial-getty@.service
>
> Does it track the modification time to know it needs to rebuild
> "systemd-serialgetty"?
>
> Because doing such a modification didn't cause it to rebuild.
>

The modification time won't trigger a rebuild since the contents hash the
same. Changing the contents of the file should trigger a rebuild, though.

-Tyler

--001a11346f6a44297004f89a0a65
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div class=3D"gmail_extra"><div class=3D"gmail_quote">On S=
un, May 4, 2014 at 4:53 PM, Joel Fernandes <span dir=3D"ltr">&lt;<a href=3D=
"mailto:joelf@ti.com" target=3D"_blank">joelf@ti.com</a>&gt;</span> wrote:<=
br><blockquote class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;border-left=
:1px #ccc solid;padding-left:1ex">


How does it figure out when it needs to rebuild a package?<br></blockquote>=
<div>=C2=A0</div><div>Bitbake generates hashes for every task that are base=
d on the data that will be used when running the task. This includes the bo=
dy of the task function, any variables it references, checksums of required=
 files, and hashes of tasks it depends on. This data is stored for each tas=
k in $BUILDDIR/tmp/stamps. The task will re-run if a matching sigdata file =
does not exist in the stamps directory. You can run bitbake-dumpsig on a si=
gdata file to see what metadata changes will cause the task to rebuild.<br>

<br></div><blockquote class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;bord=
er-left:1px #ccc solid;padding-left:1ex">
For example if I modify the file:<br>
=C2=A0../meta/recipes-core/systemd/systemd-serialgetty/serial-getty@.servic=
e<br>
<br>
Does it track the modification time to know it needs to rebuild<br>
&quot;systemd-serialgetty&quot;?<br>
<br>
Because doing such a modification didn&#39;t cause it to rebuild.<br></bloc=
kquote><div>=C2=A0</div><div>The modification time won&#39;t trigger a rebu=
ild since the contents hash the same. Changing the contents of the file sho=
uld trigger a rebuild, though.<br>

<br></div><div>-Tyler <br></div></div></div></div>

--001a11346f6a44297004f89a0a65--
