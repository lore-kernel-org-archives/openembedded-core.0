Return-Path: <ross.burton@intel.com>
Received: from mail-it0-f68.google.com (mail-it0-f68.google.com
	[209.85.214.68])
	by mail.openembedded.org (Postfix) with ESMTP id B24AF6E5FC
	for <openembedded-core@lists.openembedded.org>;
	Mon, 26 Mar 2018 09:47:46 +0000 (UTC)
Received: by mail-it0-f68.google.com with SMTP id 19-v6so9946152itw.3
	for <openembedded-core@lists.openembedded.org>;
	Mon, 26 Mar 2018 02:47:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=intel-com.20150623.gappssmtp.com; s=20150623;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=6Na5msOtuUgqTIb8Ptvn+sM7c7aWxLKfjxXTvPRSNEg=;
	b=Qd11xA87IPkm+1c5uz1b8DFugvCDRaAo3VJw9ogtdlJixYfIIR8Lii4oFnl0tbCxrt
	XA2XidFcnMpiiV09acLFy7ZaDd/+aQru90uROd15lFqXPIMYzJf55ATh0voGxa2B412h
	iEvQLvvkidT8OqYjxtZqP5y49T9zFHRX3WEMQAg8GvPr/arRLnT+Y2Yuc5T5FM//PFFY
	aJ8TXc+S6bMNehCgl7NZ0pynR6cALNpVda3jDiqJ3Nky3xz8iEDJh7sFaFx7VW2oDxaL
	QOe2OWuh/2wZefcc2KupdxYgFBWN5l9KsDtE0LOnD1sKVrQQexp3CL51BoM7iwO2IwGi
	RRNQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=6Na5msOtuUgqTIb8Ptvn+sM7c7aWxLKfjxXTvPRSNEg=;
	b=sS61gfOuBp0yk+3SXSw2DOzoiXLLLJcts6WDkWd6Us9IGw1gI7EHMuSkBbUEe06bbp
	CwwE0vTDC4r3bYptaxSzjctHklYcxNHVyocGsEvDDqX9uA1TexaBTwVrnEQRCm49wUl9
	vhPvpdYdJPmJOQgUKUA8a5/wrWrH4qLZOSpnpqWjbH4rl8SWqmFi0Dm9rE5GFPOL+jY2
	mEsSO3HPfYzH9o3YmwcHopgYFESMFizf4mO2eTnPnCeUXCsgrEHsFrsKgXL00XoW20ui
	9vQv+BAOoiTcwoyEabO2Gozq5w0oCIxvxnqzmi9tgfyVlKiyy86HwFAzzIoH8n4+AqQW
	ZB2w==
X-Gm-Message-State: AElRT7EhbHqdfILyNxcuLl2l7Y/eYeG5fDBKOhHfuzLpObM+be/C5odL
	gKuaK0gH3IYHAfchr7TqdBnxJYj83KBY+YFym5gKGg==
X-Google-Smtp-Source: AG47ELuS8kCGTaZmglMesIN2hy5ZDf0yZLp6fsNtg5RqicUm8QyYh8Xs+0rbftgXA7dJut7taYDGQlPwGdrt4DbGAek=
X-Received: by 2002:a24:f685:: with SMTP id
	u127-v6mr21414101ith.131.1522057667616; 
	Mon, 26 Mar 2018 02:47:47 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.107.30.9 with HTTP; Mon, 26 Mar 2018 02:47:27 -0700 (PDT)
In-Reply-To: <1521867314-1511-1-git-send-email-armccurdy@gmail.com>
References: <1521867314-1511-1-git-send-email-armccurdy@gmail.com>
From: "Burton, Ross" <ross.burton@intel.com>
Date: Mon, 26 Mar 2018 10:47:27 +0100
Message-ID: <CAJTo0LbYy0xQXPzudLwsyLHPKYnHRP1TDvAMz3HyNKy5uUwxpA@mail.gmail.com>
To: Andre McCurdy <armccurdy@gmail.com>
Cc: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 1/2] sanity.bbclass: quote path passed to stat in get_filesystem_id()
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
X-List-Received-Date: Mon, 26 Mar 2018 09:47:46 -0000
Content-Type: text/plain; charset="UTF-8"

A better fix would be to not use getstatusoutput() at all, but
directly hit subprocess and pass the argument as a list.

Ross

On 24 March 2018 at 04:55, Andre McCurdy <armccurdy@gmail.com> wrote:
> Although get_filesystem_id() is a private API and never gets passed
> a path containing spaces or other special characters, etc, quote the
> path anyway for consistency.
>
> Signed-off-by: Andre McCurdy <armccurdy@gmail.com>
> ---
>  meta/classes/sanity.bbclass | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/meta/classes/sanity.bbclass b/meta/classes/sanity.bbclass
> index 6716985..e0e57ce 100644
> --- a/meta/classes/sanity.bbclass
> +++ b/meta/classes/sanity.bbclass
> @@ -336,7 +336,7 @@ def check_path_length(filepath, pathname, limit):
>      return ""
>
>  def get_filesystem_id(path):
> -    status, result = oe.utils.getstatusoutput("stat -f -c '%s' %s" % ("%t", path))
> +    status, result = oe.utils.getstatusoutput("stat -f -c '%s' '%s'" % ("%t", path))
>      if status == 0:
>          return result
>      else:
> --
> 1.9.1
>
> --
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-core

