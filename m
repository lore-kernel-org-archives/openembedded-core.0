Return-Path: <richard.purdie@linuxfoundation.org>
Received: from mail-wm1-f67.google.com (mail-wm1-f67.google.com
	[209.85.128.67])
	by mail.openembedded.org (Postfix) with ESMTP id 3F9D37458D
	for <openembedded-core@lists.openembedded.org>;
	Sat, 20 Oct 2018 09:16:17 +0000 (UTC)
Received: by mail-wm1-f67.google.com with SMTP id 193-v6so5734854wme.3
	for <openembedded-core@lists.openembedded.org>;
	Sat, 20 Oct 2018 02:16:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=linuxfoundation.org; s=google;
	h=message-id:subject:from:to:cc:date:in-reply-to:references
	:mime-version:content-transfer-encoding;
	bh=nWGg2zX/HlQR8YBd52mEncLPS6fim9lKV4bIgzH8qqQ=;
	b=cFwbCIn8gYFcy9ndbg2obKb3nLwPXaZ79Of67LCYFkS9LG/oMNmVBMfb4VO3ezv8pe
	kaX6bq4NWGbe/sCF8i1vvWIXSSDhrEWdU5zzBN3OSCsJpdC0PG0c24TB7Bw//usq5nOw
	+QBuvavFGeUO8E7KTEAyYpG6cJRnubkssG9yM=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:message-id:subject:from:to:cc:date:in-reply-to
	:references:mime-version:content-transfer-encoding;
	bh=nWGg2zX/HlQR8YBd52mEncLPS6fim9lKV4bIgzH8qqQ=;
	b=O0tMluE1O0IkQHvoM0AMtn8kLPKKV5lQneZ7/U3kSUwd1r//59TKpCwtk2pCSa3Pzx
	8WBmBowVTgVvwhBjO8qFGlOPYAzDCYYzUUAIEsN3KLAGpTUExm/XWNn1ZcGwVFQQQ3Ni
	UAwAxKc4vYFUuPvruU6H2pc76bFqhxnJkNzCXiZ8/+RSk0H2Fs3FC2do+SQg3qPJ3tTW
	U8MVBKbTn6iY1dxy2KOZCOhmpeqgxHNo9KGzv8ixmDRx8CNILyk5g2B3cipNBrip0h96
	7O1L57rZOYvAYjJcwhAw/cuXCQAtfFx6tENsfhyugLvNdy4FoKf4MXVoQ1i5CwBu7n2j
	QgpA==
X-Gm-Message-State: ABuFfoiBW93E+wwEq06oYlSeOb++LcFztm43F2paKfSftQtMZMY0ZSRd
	F5MLQ7CCfASO4dWv2svCpdGrig==
X-Google-Smtp-Source: ACcGV62k4L5T9YYv8H/U2zqDAPcIFWRrSLLcHtz1mdeKL2cCxJMpTO3DtpxkRyVohZGXWJyAqo3+AQ==
X-Received: by 2002:a1c:dcc:: with SMTP id
	195-v6mr8135916wmn.117.1540026977551; 
	Sat, 20 Oct 2018 02:16:17 -0700 (PDT)
Received: from hex (5751f4a1.skybroadband.com. [87.81.244.161])
	by smtp.gmail.com with ESMTPSA id
	r134-v6sm4446528wmg.9.2018.10.20.02.16.16
	(version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
	Sat, 20 Oct 2018 02:16:16 -0700 (PDT)
Message-ID: <a1d9ca7b7bfa913983b356b854e0170967a55b57.camel@linuxfoundation.org>
From: richard.purdie@linuxfoundation.org
To: Stefan Agner <stefan@agner.ch>, opkg-devel@googlegroups.com, 
	alejandro.delcastillo@ni.com, yocto@yoctoproject.org
Date: Sat, 20 Oct 2018 10:16:14 +0100
In-Reply-To: <20181019153821.21177-1-stefan@agner.ch>
References: <20181019153821.21177-1-stefan@agner.ch>
X-Mailer: Evolution 3.28.5-0ubuntu0.18.04.1 
Mime-Version: 1.0
Cc: ricardo@foundries.io, Stefan Agner <stefan.agner@toradex.com>,
	openembedded-core@lists.openembedded.org
Subject: Re: [opkg-utils PATCH] opkg-make-index: use ctime instead of mtime
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
X-List-Received-Date: Sat, 20 Oct 2018 09:16:17 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Fri, 2018-10-19 at 17:38 +0200, Stefan Agner wrote:
> From: Stefan Agner <stefan.agner@toradex.com>
> 
> When using sstate, two parallel builds can produce two packages
> with the same mtime but different checksums. When later one of
> those two builds fetches the others ipk, the package index does
> not get udpated properly (since mtime matches). This ends up with
> messages such as:
>   Downloading file:/../tmp/work/../image/...ipk.
>   Removing corrupt package file
> /../sysroot/../var/cache/opkg/volatile/...ipk
> 
> However, in that case, ctime is different. Use ctime instead of
> mtime to prevent failures like this.
> 
> Suggested-by: Khem Raj <raj.khem@gmail.com>
> Signed-off-by: Stefan Agner <stefan.agner@toradex.com>

Acked-by: Richard Purdie <richard.purdie@linuxfoundation.org>

(I've been following this problem and this makes sense to me)

> ---
> This addresses the issue discussed here:
> 
http://lists.openembedded.org/pipermail/openembedded-core/2018-October/156348.html
> 
>  opkg-make-index | 6 +++---
>  1 file changed, 3 insertions(+), 3 deletions(-)
> 
> diff --git a/opkg-make-index b/opkg-make-index
> index 3227fc0..db7bf64 100755
> --- a/opkg-make-index
> +++ b/opkg-make-index
> @@ -115,12 +115,12 @@ for abspath in files:
>       pkg = None
>       fnameStat = os.stat(abspath)
>       if filename in old_pkg_hash:
> -          if filename in pkgsStamps and int(fnameStat.st_mtime) ==
> pkgsStamps[filename]:
> +          if filename in pkgsStamps and int(fnameStat.st_ctime) ==
> pkgsStamps[filename]:
>              if (verbose):
>                 sys.stderr.write("Found %s in Packages\n" %
> (filename,))
>              pkg = old_pkg_hash[filename]
>            else:
> -               sys.stderr.write("Found %s in Packages, but mtime
> differs - re-reading\n" % (filename,))
> +               sys.stderr.write("Found %s in Packages, but ctime
> differs - re-reading\n" % (filename,))
>  
>       if not pkg:
>            if (verbose):
> @@ -137,7 +137,7 @@ for abspath in files:
>       else:
>            old_filename = ""
>       s = packages.add_package(pkg, opt_a)
> -     pkgsStamps[filename] = fnameStat.st_mtime
> +     pkgsStamps[filename] = fnameStat.st_ctime
>       if s == 0:
>            if old_filename:
>                 # old package was displaced by newer


