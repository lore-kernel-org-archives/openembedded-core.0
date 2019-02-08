Return-Path: <andre.draszik@gmail.com>
Received: from mail-ed1-f66.google.com (mail-ed1-f66.google.com
	[209.85.208.66])
	by mail.openembedded.org (Postfix) with ESMTP id 2325A6C154
	for <openembedded-core@lists.openembedded.org>;
	Fri,  8 Feb 2019 11:59:49 +0000 (UTC)
Received: by mail-ed1-f66.google.com with SMTP id b17so2566196eds.2
	for <openembedded-core@lists.openembedded.org>;
	Fri, 08 Feb 2019 03:59:51 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:message-id:subject:from:to:date:in-reply-to
	:references:user-agent:mime-version:content-transfer-encoding;
	bh=xenionvBRh5ldRvH9sr2NNEnshgerbjQ6S0Ej4fgaB0=;
	b=ZqOJqASY42jvIHD641IT/26UcwmZtcBI/0amCugvBI8tWWBjsbdFsv7sCiUXhjoG8L
	XItKuvUS7BTfNrjzbjiGLR1KFhRTUz5m7AvrP99kYVJRXioXCSC1us9eCujEqz7nsO/w
	B6WLcc7j6nLIiu9KWtq51K3UxnrRuVnDH7hoqBgv2UeAxHfpCUvuhORDpkSK23PALubL
	owOr9kImliFnUI90FMHb9RjGR9jyHW5kER0OEpTyzyC5EIxtHqr9Fz5uUVujmGh0esbo
	txQ9z0JDQ4HgIo+w4pQNEmz3BJhfIAXH5ndMKxpt8lOiFnuTeWaOrQR+7QKIzQ5DOj6P
	EOWg==
X-Gm-Message-State: AHQUAuabWMHxm+N7j63zU3SQNfD38idaUOf87QuRa/2PnNIGAKWs8fTD
	VCtuU4vAjg8sEndnBA4f5L19iv0n
X-Google-Smtp-Source: AHgI3Ib3NRPlZCD26pG91sOuJf46H9QUCnhH5JB0YL+91P76ocrzdhd5pDZlcqkWU1ALLFFVRfud7w==
X-Received: by 2002:a50:fd0e:: with SMTP id i14mr16317866eds.98.1549627190305; 
	Fri, 08 Feb 2019 03:59:50 -0800 (PST)
Received: from tfsielt31850.fritz.box (188-141-55-36.dynamic.upc.ie.
	[188.141.55.36])
	by smtp.gmail.com with ESMTPSA id 45sm590545edz.28.2019.02.08.03.59.48
	for <openembedded-core@lists.openembedded.org>
	(version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
	Fri, 08 Feb 2019 03:59:49 -0800 (PST)
Message-ID: <7e6b799899ca0c0e9e07998add5ccd7a7d508c3b.camel@andred.net>
From: =?ISO-8859-1?Q?Andr=E9?= Draszik <git@andred.net>
To: openembedded-core@lists.openembedded.org
Date: Fri, 08 Feb 2019 11:59:47 +0000
In-Reply-To: <20190208082005.24173-1-leobsd@gmail.com>
References: <20190208082005.24173-1-leobsd@gmail.com>
User-Agent: Evolution 3.30.5-1 
MIME-Version: 1.0
Subject: Re: [PATCH v2] Fix cp's target path for ext* filesystems
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
X-List-Received-Date: Fri, 08 Feb 2019 11:59:50 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Fri, 2019-02-08 at 00:20 -0800, Leonardo Augusto wrote:
> Python subprocess' shell=True defaults to /bin/sh[1][2], which
> often refers to a POSIX-compliant shell. As the -e flag is
> not defined in the POSIX standard[3], some shells may
> interpret "-e" as the first argument to the echo command,
> causing the rest of the command line to fail.
> 
> In this particular case, "echo -e 'cd {}'" is interpreted
> as "-e cd {}", which causes the first line of the command
> to fail, and causing cp to always place the source file
> in the filesystem's root.
> 
> This issue only affects "wic cp" for ext* filesystems.
> 
> [1] https://docs.python.org/2/library/subprocess.html
> [2] https://docs.python.org/3/library/subprocess.html
> [3] http://pubs.opengroup.org/onlinepubs/9699919799
> 
> Signed-off-by: Leonardo Augusto <leobsd@gmail.com>
> ---
>  scripts/lib/wic/engine.py | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/scripts/lib/wic/engine.py b/scripts/lib/wic/engine.py
> index 4662c665c0..b4be796752 100644
> --- a/scripts/lib/wic/engine.py
> +++ b/scripts/lib/wic/engine.py
> @@ -331,7 +331,7 @@ class Disk:
>      def copy(self, src, pnum, path):
>          """Copy partition image into wic image."""
>          if self.partitions[pnum].fstype.startswith('ext'):
> -            cmd = "echo -e 'cd {}\nwrite {} {}' | {} -w {}".\
> +            cmd = "echo 'cd {}\nwrite {} {}' | {} -w {}".\

This causes some shell's echos to output a literal \n (two characters, '\'
and 'n').

The solution should be to use printf instead of echo...

Cheers,
Andre'

>                        format(path, src, os.path.basename(src),
>                               self.debugfs, self._get_part_image(pnum))
>          else: # fat
> -- 
> 2.17.1
> 


