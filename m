Return-Path: <raj.khem@gmail.com>
Received: from mail-qt1-f193.google.com (mail-qt1-f193.google.com
	[209.85.160.193])
	by mail.openembedded.org (Postfix) with ESMTP id A92E17FD1B
	for <openembedded-core@lists.openembedded.org>;
	Mon, 25 Nov 2019 22:28:42 +0000 (UTC)
Received: by mail-qt1-f193.google.com with SMTP id 30so19100211qtz.12
	for <openembedded-core@lists.openembedded.org>;
	Mon, 25 Nov 2019 14:28:44 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc; bh=9wFKHA8kh3hI16tzGMAq1MP+16mCS1BOqSnrqPKhe5w=;
	b=KKx7BJAb5Il2wVl4/BGT+CH/lrihanuXdEKTVyNT9+7VhgRH9pqXL1JAL7EGLYcHXX
	ZcZMPxn1urQnVpNgd/iXkvUBKECD1vr9ULNWWKcpdSM3yHJxFbYvlS8Ql03pal6vQNZk
	Cy+JAMD0cyYJbP6lP60Py0OwEANrer+lzx5fM0NW+2eAmzeCLOjiRAGTJz2VW9OyiXGi
	URka3cHn2yRTXY8dTHciDEmqs9o0TOEXT2/u1BEsSN0nlC40uH9ixthpRozsgyLKvcJp
	KZ8SIoDWBR6DcN1B21Mo/YfUI/d8iMsgTwQw+9r2QQiDcKQATHBPXLoNW1saOaF71Mqm
	+flA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=9wFKHA8kh3hI16tzGMAq1MP+16mCS1BOqSnrqPKhe5w=;
	b=pWVwI4Rn79AItIY7SQneJsjSMsqZ/OUEiZTykE076rF9IQD2cTWoG65v7UZXPDzs+w
	XgZBVCR9mlMQ8npFUe1Ib3cut5AhQRUTGfaYOemdhzlZU7T2p9P/h8bla9gdUaV4nuGW
	2do6a33gLfJj7tUW3W8qgj7dQOlxQoW8nZeJNRLmR79eY5G00GrnKZPauUVjUFEKdb5Q
	0K60fpZAXJ+GivRjl+o1OXD/zzq9uDWRNScFnek5NdbVX32sSStiT24bKhwFcuMpGz4V
	FfUt7Kx2J/yi5FXj9rBg/rb6FeSGJxofS+LNZ4dm8GVjjPqxbrUY0A3vqUJOsOqoFide
	QOhw==
X-Gm-Message-State: APjAAAWQ5d7XtseFs97lPzWH2TE30/+C0c2oi+j5C6EFSqGDcJMG4g5U
	5IldzMpSxRbOsSHe+mJXAZ2LUmdh0HM/vUPVF5g=
X-Google-Smtp-Source: APXvYqxZOy9R+QDlF7EIBauisVd+rbIxXXOT2wWAuNRBcN3Rvqp5hkkjrAo9IOOfD5njzuFFrwb282LUTHdX6x20RxA=
X-Received: by 2002:ac8:5557:: with SMTP id o23mr31695435qtr.378.1574720923121;
	Mon, 25 Nov 2019 14:28:43 -0800 (PST)
MIME-Version: 1.0
References: <20191125221357.6560-1-kergoth@gmail.com>
	<20191125221357.6560-2-kergoth@gmail.com>
In-Reply-To: <20191125221357.6560-2-kergoth@gmail.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Mon, 25 Nov 2019 14:28:16 -0800
Message-ID: <CAMKF1soiu-7+hGiRp-Em7erFNgmdXbTpxVO29OHMQxjhxpMw6Q@mail.gmail.com>
To: Christopher Larson <kergoth@gmail.com>
Cc: Christopher Larson <chris_larson@mentor.com>,
	Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 2/3] dosfstools: fix CP437 error from `dosfsck -l`
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
X-List-Received-Date: Mon, 25 Nov 2019 22:28:42 -0000
Content-Type: text/plain; charset="UTF-8"

On Mon, Nov 25, 2019 at 2:12 PM Christopher Larson <kergoth@gmail.com> wrote:
>
> From: Christopher Larson <chris_larson@mentor.com>
>
> Fix this error seen when using dosfsck -l to list fs contents:
>
>     CP437: Invalid argument
>
> Signed-off-by: Christopher Larson <chris_larson@mentor.com>
> ---
>  meta/recipes-devtools/dosfstools/dosfstools_4.1.bb | 3 +++
>  1 file changed, 3 insertions(+)
>
> diff --git a/meta/recipes-devtools/dosfstools/dosfstools_4.1.bb b/meta/recipes-devtools/dosfstools/dosfstools_4.1.bb
> index 69aa81af44..c99d2019c8 100644
> --- a/meta/recipes-devtools/dosfstools/dosfstools_4.1.bb
> +++ b/meta/recipes-devtools/dosfstools/dosfstools_4.1.bb
> @@ -23,3 +23,6 @@ EXTRA_OECONF = "--without-udev --enable-compat-symlinks"
>  CFLAGS += "-D_GNU_SOURCE -D_LARGEFILE_SOURCE -D_FILE_OFFSET_BITS=64"
>
>  BBCLASSEXTEND = "native"
> +
> +# Add codepage437 to avoid error from `dosfsck -l`
> +RRECOMMENDS_${PN}_append_libc-glibc += "glibc-gconv-ibm437"

I think += should be dropped

> --
> 2.11.1
>
> --
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-core

