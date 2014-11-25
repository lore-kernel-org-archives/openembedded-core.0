Return-Path: <paul.betafive@gmail.com>
Received: from mail-qc0-f174.google.com (mail-qc0-f174.google.com
	[209.85.216.174])
	by mail.openembedded.org (Postfix) with ESMTP id 1B4E560CFC
	for <openembedded-core@lists.openembedded.org>;
	Tue, 25 Nov 2014 17:41:03 +0000 (UTC)
Received: by mail-qc0-f174.google.com with SMTP id c9so798661qcz.33
	for <openembedded-core@lists.openembedded.org>;
	Tue, 25 Nov 2014 09:41:04 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:sender:in-reply-to:references:from:date:message-id
	:subject:to:cc:content-type;
	bh=kp8wB5di5uuAzxMZ2Pz+vJWLW93aTqCTRLpZqNWRGm4=;
	b=GvtZs3u552RUAB3cJlXa1u+H+94ZJ0VjCnMC3bBd1dEzSWOm3zcKSrJfQBc8+jpfWZ
	Fm4Wd0C7s/DlXDakAg4oAbmP2TevF8GpfIZ1xKZHc6unlLnrlXZ/xz01HLvoxlJctptw
	0/EYxHwwSy1YaEdbuZU5Q29vb9j0NO9q3feUAA0NjEq4A0or/UTj6bIBfBqmvow9S8iD
	SEtZSWax0xf1Ko515R9Nb8MSDIf7mpuiS/mrXZld570i/lCr8nOBx51iE/yfRRlOkU9O
	8DD5A5+eOiqeqUOBLezGTOWapQqyi/MxiMn80+oopM/PKQS1/IeaBLHVRynt8fS0jKqb
	lnQg==
X-Received: by 10.140.23.198 with SMTP id 64mr38533540qgp.62.1416937264520;
	Tue, 25 Nov 2014 09:41:04 -0800 (PST)
MIME-Version: 1.0
Sender: paul.betafive@gmail.com
Received: by 10.140.143.146 with HTTP; Tue, 25 Nov 2014 09:40:24 -0800 (PST)
In-Reply-To: <34bc6edfa0a43ee42f91fab28d009a8c3814b44a.1416934753.git.paul.eggleton@linux.intel.com>
References: <cover.1416934753.git.paul.eggleton@linux.intel.com>
	<34bc6edfa0a43ee42f91fab28d009a8c3814b44a.1416934753.git.paul.eggleton@linux.intel.com>
From: Paul Barker <paul@paulbarker.me.uk>
Date: Tue, 25 Nov 2014 17:40:24 +0000
X-Google-Sender-Auth: p4ikmRdwx0PJHm5YMQrktBSUuZ0
Message-ID: <CANyK_8eHmuktc=tzdJOkWqzeUm2XLWxSToj51yC=5xhew5yYgQ@mail.gmail.com>
To: Paul Eggleton <paul.eggleton@linux.intel.com>
Cc: OE Core <openembedded-core@lists.openembedded.org>
Subject: Re: [RFC PATCH 1/7] lib/oe/patch: fall back to patch if git apply fails
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
X-List-Received-Date: Tue, 25 Nov 2014 17:41:05 -0000
Content-Type: text/plain; charset=UTF-8

On 25 November 2014 at 17:28, Paul Eggleton
<paul.eggleton@linux.intel.com> wrote:
> When PATCHTOOL = "git", git apply doesn't support fuzzy application, so
> if a patch requires that it's better to be able to apply it rather than
> just failing.
>
> Signed-off-by: Paul Eggleton <paul.eggleton@linux.intel.com>
> ---
>  meta/lib/oe/patch.py | 6 +++++-
>  1 file changed, 5 insertions(+), 1 deletion(-)
>
> diff --git a/meta/lib/oe/patch.py b/meta/lib/oe/patch.py
> index b085c9d..788f465 100644
> --- a/meta/lib/oe/patch.py
> +++ b/meta/lib/oe/patch.py
> @@ -219,7 +219,11 @@ class GitApplyTree(PatchTree):
>              return _applypatchhelper(shellcmd, patch, force, reverse, run)
>          except CmdError:
>              shellcmd = ["git", "--git-dir=.", "apply", "-p%s" % patch['strippath']]
> -            return _applypatchhelper(shellcmd, patch, force, reverse, run)
> +            try:
> +                output = _applypatchhelper(shellcmd, patch, force, reverse, run)
> +            except CmdError:
> +                output = PatchTree._applypatch(self, patch, force, reverse, run)
> +            return output
>

Would this give a warning or other notification if the fallback to
'patch' is used? When developing patches it'd probably be good to know
whether they're exactly correct or not.

I haven't looked at _applypatchhelper or _applypatch so I'm not sure
if there's some notification hidden in there.

Cheers,

-- 
Paul Barker

Email: paul@paulbarker.me.uk
http://www.paulbarker.me.uk

