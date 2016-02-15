Return-Path: <ross.burton@intel.com>
Received: from mail-ig0-f181.google.com (mail-ig0-f181.google.com
	[209.85.213.181])
	by mail.openembedded.org (Postfix) with ESMTP id ED7B960291
	for <openembedded-core@lists.openembedded.org>;
	Mon, 15 Feb 2016 12:31:21 +0000 (UTC)
Received: by mail-ig0-f181.google.com with SMTP id 5so54684368igt.0
	for <openembedded-core@lists.openembedded.org>;
	Mon, 15 Feb 2016 04:31:22 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=intel-com.20150623.gappssmtp.com; s=20150623;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc:content-type;
	bh=tYPZ3/3Wq6YbDPA2dsfoXIpwtsqZrewEvAnTG8RoxUY=;
	b=wYq72o+wz8DVc/gXb5FfF0kcyDvk7MNKZBoj2BfzoYN99/L5Jb1MbbyVw93Ksisu82
	DEW36dN7zdUzjb/l2oLrUkVD9WMpEuxw11gIfxWdAwrqww6Y2Wh3hrYBatSv2WNqT8OQ
	zvEBObgcOKBHZuuC0A3NQ7UoR9MlvY9C3wp3jLk03JnKrCD1pMdjkEK0MKAqWlTo+wm7
	I4AJmyDaITTUuXsYZ6ZlqYRG1fQcy78bgi61dy/ySUIBnmEfHzWvo47YoncF9F614EMg
	LLN02p5TM2jjSjQhwjLcYzkjVWFl/0k1hH2H6UkgyeFfLCJMbn5/MFGLPwWwSV8H4ePV
	/n3w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc:content-type;
	bh=tYPZ3/3Wq6YbDPA2dsfoXIpwtsqZrewEvAnTG8RoxUY=;
	b=aUI7vz5xyqDMxztZSeMIr8XHSv1YfWZUtUyri59rCy6jZRPVbOx0o+aaaToq9w0ujj
	gB6l8vsuGk3pJuq20OnRqu05564NLPIZrBwlWyrUl/gJ7CWEG7jWlpyRMiJ9XBVXTNmf
	ydk3/J1fqNW4yU+kk+qDrrWEvMnyVka3jDDBXoFlDjrYDRD9ynVgq/O0QBg9w1Nz93PF
	6JHuy8eEjCSBFddA7rWW7+ddHbr2wyK0OGNVCdcM32J2+XQss2mePGo1jry9XsI6F8ZJ
	q519FYvPUPnVGcJPHdMNBg7Yk4lp9nKGgn97WrZn7YVPUW7NooYWlEE2QvLCuxU3ySnM
	6Czw==
X-Gm-Message-State: AG10YOQSjNSySNLnk7T0sYtCkjlkk5kR3t2IKMunh7MW/G5KEEbPaEpXV7Ir0J4UqErdVXD8oxpvCO0b77WfTCmu
X-Received: by 10.50.78.227 with SMTP id e3mr11428132igx.64.1455539482179;
	Mon, 15 Feb 2016 04:31:22 -0800 (PST)
MIME-Version: 1.0
Received: by 10.107.162.70 with HTTP; Mon, 15 Feb 2016 04:31:02 -0800 (PST)
In-Reply-To: <eea9c9c9b686194c87e06b478b4e3a8e3447d358.1455501148.git.kai.kang@windriver.com>
References: <cover.1455501148.git.kai.kang@windriver.com>
	<eea9c9c9b686194c87e06b478b4e3a8e3447d358.1455501148.git.kai.kang@windriver.com>
From: "Burton, Ross" <ross.burton@intel.com>
Date: Mon, 15 Feb 2016 12:31:02 +0000
Message-ID: <CAJTo0LaQ-viF19UDx0XAVFiEi=7a+rf6maPfjr-6QSLhVwRSSQ@mail.gmail.com>
To: Kang Kai <kai.kang@windriver.com>
Cc: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 1/1] useradd_base.bbclass: fix simultaneous with flock
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
X-List-Received-Date: Mon, 15 Feb 2016 12:31:22 -0000
Content-Type: multipart/alternative; boundary=089e0111b734cad664052bce3179

--089e0111b734cad664052bce3179
Content-Type: text/plain; charset=UTF-8

On 15 February 2016 at 01:59, <kai.kang@windriver.com> wrote:

> +               eval flock -x -w 100 $rootdir/tmp/user-and-group-ops.flock
> -c  \'$PSEUDO useradd $opts\' || true
>

This is a great patch, but why not just flock $rootdir/etc instead of new
file in tmp?    Surely images end up being created with
/tmp/user-and-group-ops.flock in them?

Ross

--089e0111b734cad664052bce3179
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div class=3D"gmail_extra"><br><div class=3D"gmail_quote">=
On 15 February 2016 at 01:59,  <span dir=3D"ltr">&lt;<a href=3D"mailto:kai.=
kang@windriver.com" target=3D"_blank">kai.kang@windriver.com</a>&gt;</span>=
 wrote:<br><blockquote class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;bor=
der-left:1px #ccc solid;padding-left:1ex"><div id=3D":2u7" class=3D"a3s" st=
yle=3D"overflow:hidden">+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0eval flock -x -w 100 $rootdir/tmp/user-and-group-ops.flock -c=C2=A0 \=
&#39;$PSEUDO useradd $opts\&#39; || true<br></div></blockquote></div><br>Th=
is is a great patch, but why not just flock $rootdir/etc instead of new fil=
e in tmp? =C2=A0 =C2=A0Surely images end up being created with /tmp/user-an=
d-group-ops.flock in them?</div><div class=3D"gmail_extra"><br></div><div c=
lass=3D"gmail_extra">Ross</div></div>

--089e0111b734cad664052bce3179--
