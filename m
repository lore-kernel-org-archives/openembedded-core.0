Return-Path: <richard.purdie@linuxfoundation.org>
Received: from mail-wr1-f66.google.com (mail-wr1-f66.google.com
	[209.85.221.66])
	by mail.openembedded.org (Postfix) with ESMTP id 3EC187F7D1
	for <openembedded-core@lists.openembedded.org>;
	Sun, 29 Dec 2019 10:44:43 +0000 (UTC)
Received: by mail-wr1-f66.google.com with SMTP id j42so30241394wrj.12
	for <openembedded-core@lists.openembedded.org>;
	Sun, 29 Dec 2019 02:44:44 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=linuxfoundation.org; s=google;
	h=message-id:subject:from:to:date:in-reply-to:references:user-agent
	:mime-version:content-transfer-encoding;
	bh=iFK2tRweVKPhhWcIAqMXwRF4V5ON61JeHZ/LJD3bZ1k=;
	b=ODiAi0cFau7Zyd9lECYo/VKwOGxgDTESkrUvr6jREpn7xQE3v8zlYcyARY3oSDRXDk
	2TLmLLEfK4s1sesefDlLBa4ag+ooBMdwRH+bQILNOeScgRNLEctPHsiP2I/E9a2Q3wuP
	n9oYwVyXEoOuWNMcvLnF7lvg4CO9iz04iMz80=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:message-id:subject:from:to:date:in-reply-to
	:references:user-agent:mime-version:content-transfer-encoding;
	bh=iFK2tRweVKPhhWcIAqMXwRF4V5ON61JeHZ/LJD3bZ1k=;
	b=aEUFIyRB696QAyo3Njzm9pmksnDpoa8iUopbRhDwqXtrp67/ZYpCIgezUYGkoOm3n4
	5pOAU0CGqDvcE2t6Ly6aJE3f3zwKxYfT3U3dsNfRAxs11M2wAMf4/hWQMe8GnBE8wOhe
	4KjgO5JT5u3imAQ4Kvr5aEhHmBmvG8gUqt8mD/G+nEKcZ40UnW8Q4KlUKoxDQiiFd/yo
	obHxcjdDbV//f266dtd5wxD4Fj4K1BAdY1rk818heYILiD/lzCorMThomQx6LdvY3c5c
	AwRzDwi1HDxJp9c5SXezskeYAvGRUAfUE0xA2nYGlBMSrOcz3R7rl0Fkclx5vUX1V33e
	A1Nw==
X-Gm-Message-State: APjAAAUSjaCmkNocA495+ZC1WwisepPjK3rJroIdo7cXXnxuMApWGyWo
	ha3okym/YZvAMRb3lGewHPUkfA==
X-Google-Smtp-Source: APXvYqzH3ypQ1XnUShoWsuHfIkilFAfPkMPxXZmC0XCxvNdqf+qdbnMfQr9lsjP6BPAGm6iqy0ZsNg==
X-Received: by 2002:adf:ea8a:: with SMTP id s10mr59156695wrm.278.1577616283849;
	Sun, 29 Dec 2019 02:44:43 -0800 (PST)
Received: from hex (5751f4a1.skybroadband.com. [87.81.244.161])
	by smtp.gmail.com with ESMTPSA id
	60sm43109880wrn.86.2019.12.29.02.44.42
	(version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
	Sun, 29 Dec 2019 02:44:43 -0800 (PST)
Message-ID: <38ce5ffef0c857e6b90a0c51bc3ffefb9c724622.camel@linuxfoundation.org>
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Alex Kiernan <alex.kiernan@gmail.com>, 
	openembedded-core@lists.openembedded.org
Date: Sun, 29 Dec 2019 10:44:41 +0000
In-Reply-To: <20191229093146.40360-1-alex.kiernan@gmail.com>
References: <20191229093146.40360-1-alex.kiernan@gmail.com>
User-Agent: Evolution 3.34.1-2 
MIME-Version: 1.0
Subject: Re: [PATCH] lib/oe/qa: handle missing data attribute in __exit__
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
X-List-Received-Date: Sun, 29 Dec 2019 10:44:43 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Sun, 2019-12-29 at 09:31 +0000, Alex Kiernan wrote:
> If mmap fails in open, we don't have a data attribute so when we
> execute
> as a context manager the call to self.data.close needs to handle the
> missing attribute:
> 
>   File:
> '/home/akiernan/nanohub/build/../poky/meta/classes/chrpath.bbclass',
> lineno: 11, function: process_file_linux
>        0007:    with oe.qa.ELFFile(fpath) as elf:
>        0008:        try:
>        0009:            elf.open()
>        0010:        except oe.qa.NotELFFileError:
>    *** 0011:            return
>        0012:
>        0013:    p = sub.Popen([cmd, '-l',
> fpath],stdout=sub.PIPE,stderr=sub.PIPE)
>        0014:    out, err = p.communicate()
>        0015:    # If returned successfully, process stdout for
> results
>   File: '/home/akiernan/nanohub/build/../poky/meta/lib/oe/qa.py',
> lineno: 50, function: __exit__
>        0046:    def __enter__(self):
>        0047:        return self
>        0048:
>        0049:    def __exit__(self, exc_type, exc_value, traceback):
>    *** 0050:        self.data.close()
>        0051:
>        0052:    def open(self):
>        0053:        with open(self.name, "rb") as f:
>        0054:            try:
>   Exception: AttributeError: 'ELFFile' object has no attribute 'data'
> 
> Fixes: 7785c41d0b95 ("chrpath: do less work")
> Signed-off-by: Alex Kiernan <alex.kiernan@gmail.com>
> ---
> 
>  meta/lib/oe/qa.py | 6 +++++-
>  1 file changed, 5 insertions(+), 1 deletion(-)
> 
> diff --git a/meta/lib/oe/qa.py b/meta/lib/oe/qa.py
> index 21066c4dc3b3..d85206f155f0 100644
> --- a/meta/lib/oe/qa.py
> +++ b/meta/lib/oe/qa.py
> @@ -47,7 +47,11 @@ class ELFFile:
>          return self
>  
>      def __exit__(self, exc_type, exc_value, traceback):
> -        self.data.close()
> +        try:
> +            self.data.close()
> +        except AttributeError:
> +            # If we failed to mmap in open then the data attribute
> won't exist
> +            pass
>  
>      def open(self):
>          with open(self.name, "rb") as f:

Thanks, there was a patch in master-next which was being held for
various reasons but I fixed the commit message and I merged it early on
to resolve this in master.

Cheers,

Richard


