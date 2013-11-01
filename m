Return-Path: <eu@felipetonello.com>
Received: from mail-oa0-f41.google.com (mail-oa0-f41.google.com
	[209.85.219.41])
	by mail.openembedded.org (Postfix) with ESMTP id C6FB06D4EE
	for <openembedded-core@lists.openembedded.org>;
	Fri,  1 Nov 2013 03:11:52 +0000 (UTC)
Received: by mail-oa0-f41.google.com with SMTP id o9so4068451oag.14
	for <openembedded-core@lists.openembedded.org>;
	Thu, 31 Oct 2013 20:11:54 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:message-id:date:from:user-agent:mime-version:to
	:subject:references:in-reply-to:content-type
	:content-transfer-encoding;
	bh=DAkey9mIyf1lE7bqqIU+0b4xlSEsjDh9CADmaXKMcUg=;
	b=a6nN5D7XyXaXdOszwlT3um3bpMydRJ73eE9/TVGEezSpqRc883lnp3JJZTp5ouOy2h
	xvfj0C1qDKp8su+5bsSyf2FdHJRyulbreBwgCEtQ8+2f6gvjnYBbuQO6PbrqXkH0HLqg
	dAqhDsgu5QaiZgo78JNm/EB1r+COZZxi4areMtFseFpgEfRGD5+Ev/RsX/inuD2EgcTu
	bXqMFaowmZ/ikCoBmBOIsYeweL4OPn1HK0/rZiq08HdGPk4Vi07Gg5p4pC6YzCmObBWd
	SUshKnK0utMSERKIbSRcMPcAdf4Alxl11F0bqQh7Su5x3qfocWeY/IypDsfBLl5Oi7ax
	eGfQ==
X-Gm-Message-State: ALoCoQnpEWUQe/QbryocCr41kgyjCWbvYBZruUCSOOh8NOeudVQ8Z8fdvyjzPudc6mYAmG6DrAzo
X-Received: by 10.60.95.202 with SMTP id dm10mr781927oeb.0.1383275514543;
	Thu, 31 Oct 2013 20:11:54 -0700 (PDT)
Received: from localhost.localdomain (wsip-70-183-20-162.oc.oc.cox.net.
	[70.183.20.162])
	by mx.google.com with ESMTPSA id s9sm10701844obu.4.2013.10.31.20.11.53
	for <openembedded-core@lists.openembedded.org>
	(version=TLSv1 cipher=RC4-SHA bits=128/128);
	Thu, 31 Oct 2013 20:11:53 -0700 (PDT)
Message-ID: <52731BF7.1070302@felipetonello.com>
Date: Thu, 31 Oct 2013 20:11:51 -0700
From: Felipe Ferreri Tonello <eu@felipetonello.com>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:24.0) Gecko/20100101 Thunderbird/24.0
MIME-Version: 1.0
To: openembedded-core@lists.openembedded.org
References: <1383272753-20012-1-git-send-email-eu@felipetonello.com>
In-Reply-To: <1383272753-20012-1-git-send-email-eu@felipetonello.com>
Subject: Re: [PATCH] package.bbclass: Fix split_and_strip_files when file has single quote (')
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
X-List-Received-Date: Fri, 01 Nov 2013 03:11:53 -0000
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit

On 10/31/2013 07:25 PM, eu@felipetonello.com wrote:
> From: "Felipe F. Tonello" <eu@felipetonello.com>
>
> Fix false error report when a file that has a single quote by escaping
> the single quote. Some packages might install files with quotes, such
> as music files and other types, that will cause the problem.
>
> Signed-off-by: Felipe F. Tonello <eu@felipetonello.com>
> ---
>   meta/classes/package.bbclass | 2 +-
>   1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/meta/classes/package.bbclass b/meta/classes/package.bbclass
> index b0f44c7..a12b7b7 100644
> --- a/meta/classes/package.bbclass
> +++ b/meta/classes/package.bbclass
> @@ -747,7 +747,7 @@ python split_and_strip_files () {
>       # 16 - kernel module
>       def isELF(path):
>           type = 0
> -        ret, result = oe.utils.getstatusoutput("file '%s'" % path)
> +        ret, result = oe.utils.getstatusoutput("file '%s'" % path.replace("'", "\\'"))
>
>           if ret:
>               msg = "split_and_strip_files: 'file %s' failed" % path
>


I just found a bug in this implementation. I will send a v2 shortly.

Felipe

