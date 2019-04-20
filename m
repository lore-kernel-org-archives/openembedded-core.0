Return-Path: <guslees@gmail.com>
Received: from mail-yb1-f196.google.com (mail-yb1-f196.google.com
	[209.85.219.196])
	by mail.openembedded.org (Postfix) with ESMTP id D68986074F
	for <openembedded-core@lists.openembedded.org>;
	Sat, 20 Apr 2019 04:01:16 +0000 (UTC)
Received: by mail-yb1-f196.google.com with SMTP id v2so292358ybm.12
	for <openembedded-core@lists.openembedded.org>;
	Fri, 19 Apr 2019 21:01:18 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to;
	bh=0PmfRUGp1EFdes8YNFuD9C9OvPJjdgd9/vlXKN4tOeI=;
	b=uH1HyaY2FS/818pEzE7BUMH3+99KWWnhn68DVUMKpSBqOrjwiaKfSX4OzYFDWUifFA
	ZwbF3RcIdY1oE4IbLToppTeorVefnXUpovsimLIUgjZnGyeAMV8RVJ/ymbi9j2BphYNw
	qUSPLRAiKClWzt0Ix9d2TzliSK9NJob3XKIsg6dEiD78zqxmU9T1D4EenH6W7SGjf3GS
	lUYkEEoDNNlRnzkf4e/hKTtWvgUTCyKUzkFOO2QEPPFu0tVpRHi7jRpp5fApehXZjJxS
	c97Q4KD+gKQwRVcYd0YGgu/1wl9HpGQMG85Gm275XHatojucyY9y67t4ZK/YeDol2QiG
	HdYA==
X-Gm-Message-State: APjAAAUL0l+xTBrkl3xQY5p508bU1DGZhDVXuTQWwsoduiLRT44NYXFb
	cRtMkqUugLVJB5sLemjOqcaMAIsqsY4A3Xaxkcxufg==
X-Google-Smtp-Source: APXvYqzJgl7OYA9rOAji9yBT4EJKjkGyy/uPhWPRN2MisGIGaoBBKCcWAhKK2gt3XG/HrL5PpWtLCxStOHXj3pnNBYs=
X-Received: by 2002:a25:8b04:: with SMTP id i4mr5952154ybl.348.1555732877424; 
	Fri, 19 Apr 2019 21:01:17 -0700 (PDT)
MIME-Version: 1.0
References: <20190321054605.902-1-gus@inodes.org>
In-Reply-To: <20190321054605.902-1-gus@inodes.org>
From: Angus Lees <gus@inodes.org>
Date: Sat, 20 Apr 2019 14:01:04 +1000
Message-ID: <CAPA_H3fBv3jihihW=3ZdWyapvQb242HDjSNbSUs4UnPT7paKsQ@mail.gmail.com>
To: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH] Revert "wic: Set a miniumum FAT16 volume size."
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
X-List-Received-Date: Sat, 20 Apr 2019 04:01:17 -0000
Content-Type: multipart/alternative; boundary="000000000000863cf20586ee4988"

--000000000000863cf20586ee4988
Content-Type: text/plain; charset="UTF-8"

ping?

On Thu, 21 Mar 2019 at 16:49, Angus Lees <gus@inodes.org> wrote:

> This reverts commit f7dfb4d43247d3c13a4e0a3853007d63b9512b83.
>
> FAT16 volumes do not have a minimum size of 8250 blocks
> (== slightly over 4MB).  Exhibit A: floppy disks.
>
> The original commit message suggests this was a workaround for a bug in
> parted - in which case we should fix it there, or use the wic
> `--fixed-size` option to pass down an enforced minimum from a more
> context-aware point in the callstack.
> ---
> (This should also be backported to sumo)
>
>  scripts/lib/wic/partition.py | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/scripts/lib/wic/partition.py b/scripts/lib/wic/partition.py
> index 3fe5c4e26c..2178321404 100644
> --- a/scripts/lib/wic/partition.py
> +++ b/scripts/lib/wic/partition.py
> @@ -322,7 +322,7 @@ class Partition():
>
>          dosfs_cmd = "mkdosfs %s -i %s %s %s -C %s %d" % \
>                      (label_str, self.fsuuid, size_str, extraopts, rootfs,
> -                     max(8250, rootfs_size))
> +                     rootfs_size)
>          exec_native_cmd(dosfs_cmd, native_sysroot)
>
>          mcopy_cmd = "mcopy -i %s -s %s/* ::/" % (rootfs, rootfs_dir)
> --
> 2.11.0
>
>

-- 
 - Gus

--000000000000863cf20586ee4988
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">ping?</div><br><div class=3D"gmail_quote"><div dir=3D"ltr"=
 class=3D"gmail_attr">On Thu, 21 Mar 2019 at 16:49, Angus Lees &lt;<a href=
=3D"mailto:gus@inodes.org">gus@inodes.org</a>&gt; wrote:<br></div><blockquo=
te class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px =
solid rgb(204,204,204);padding-left:1ex">This reverts commit f7dfb4d43247d3=
c13a4e0a3853007d63b9512b83.<br>
<br>
FAT16 volumes do not have a minimum size of 8250 blocks<br>
(=3D=3D slightly over 4MB).=C2=A0 Exhibit A: floppy disks.<br>
<br>
The original commit message suggests this was a workaround for a bug in<br>
parted - in which case we should fix it there, or use the wic<br>
`--fixed-size` option to pass down an enforced minimum from a more<br>
context-aware point in the callstack.<br>
---<br>
(This should also be backported to sumo)<br>
<br>
=C2=A0scripts/lib/wic/partition.py | 2 +-<br>
=C2=A01 file changed, 1 insertion(+), 1 deletion(-)<br>
<br>
diff --git a/scripts/lib/wic/partition.py b/scripts/lib/wic/partition.py<br=
>
index 3fe5c4e26c..2178321404 100644<br>
--- a/scripts/lib/wic/partition.py<br>
+++ b/scripts/lib/wic/partition.py<br>
@@ -322,7 +322,7 @@ class Partition():<br>
<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0dosfs_cmd =3D &quot;mkdosfs %s -i %s %s %=
s -C %s %d&quot; % \<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0(label_str, self.fsuuid, size_str, extraopts, rootfs,<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0max(8250, rootfs_size))<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0rootfs_size)<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0exec_native_cmd(dosfs_cmd, native_sysroot=
)<br>
<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0mcopy_cmd =3D &quot;mcopy -i %s -s %s/* :=
:/&quot; % (rootfs, rootfs_dir)<br>
-- <br>
2.11.0<br>
<br>
</blockquote></div><br clear=3D"all"><div><br></div>-- <br><div dir=3D"ltr"=
 class=3D"gmail_signature">=C2=A0- Gus</div>

--000000000000863cf20586ee4988--
