Return-Path: <richard.purdie@linuxfoundation.org>
Received: from mail-wr1-f51.google.com (mail-wr1-f51.google.com
	[209.85.221.51])
	by mail.openembedded.org (Postfix) with ESMTP id 6BF247D2A1
	for <openembedded-core@lists.openembedded.org>;
	Mon, 15 Apr 2019 07:59:31 +0000 (UTC)
Received: by mail-wr1-f51.google.com with SMTP id k17so15912650wrx.10
	for <openembedded-core@lists.openembedded.org>;
	Mon, 15 Apr 2019 00:59:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=linuxfoundation.org; s=google;
	h=message-id:subject:from:to:date:in-reply-to:references:user-agent
	:mime-version:content-transfer-encoding;
	bh=TyfzN5dKAE/mbcyOrfkn5+V/WoQz1MO8HnZhSo5CwZE=;
	b=YB5ELzZb7TNdvJwo7OXC175jIrHSIZcK7poPvseroGI8XnPAhqgX/3cyaYqVsfDX2e
	9oxJndIPdToY9oUMsJAMpZisCLVpz5ZVrd7OTqDFtajhfLLJAL5JmDNXQ50VC6i4GhKg
	djtQhROUalSSj0XcSsri4msSn9H/dEtMNcyo8=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:message-id:subject:from:to:date:in-reply-to
	:references:user-agent:mime-version:content-transfer-encoding;
	bh=TyfzN5dKAE/mbcyOrfkn5+V/WoQz1MO8HnZhSo5CwZE=;
	b=M2G57WrCzxD1cKHZ0eXmG+aLQq8vLA/wv2jNoyb/F8a/0pPrzpY0CoNtji405xXlle
	M/q+pt6HS792Ahgtj/1UHa/gyui59ISHmyFwRPkV1bGB2xlAIaGSxXcqN8JZQhsHP3xY
	UHkovosYVM7Z2JI0omQvnBahm4wSUAQwgAv191oX2n4ebO83JbKjuBPNS4pkMD0oDXxz
	pVn39v6HqxCWEuGyv6EvuqNvwBzXLl5s5CEZU3UhyMvllqq+Tgf/Z/SiMSUso771iEua
	pm/hYxJWALApNFw599xjil/p9C9rSDwPhN+iyNhqLmnlE8A56OgyST/FWx4GoOOFBq7c
	i/WA==
X-Gm-Message-State: APjAAAUYe4x0X1g2zivWBNoJwf1ZpByY5OQ5ekdswI0jKaGm8tpZ6cKO
	LUfkRuo54iDbXLjSbh8CUJwkxg==
X-Google-Smtp-Source: APXvYqxk1y9FFnvRMNzd5WP0d+RRL6WExmN8Vs/DqYdhDE2Y0zcOnoUKE6ZuutzLGtCv16IMDqAf1A==
X-Received: by 2002:adf:fe41:: with SMTP id m1mr46983678wrs.220.1555315171921; 
	Mon, 15 Apr 2019 00:59:31 -0700 (PDT)
Received: from hex (5751f4a1.skybroadband.com. [87.81.244.161])
	by smtp.gmail.com with ESMTPSA id
	s21sm9794107wra.45.2019.04.15.00.59.30
	(version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
	Mon, 15 Apr 2019 00:59:31 -0700 (PDT)
Message-ID: <8879daf5747ec05fa2430354dbd38cc3ae5e1cd5.camel@linuxfoundation.org>
From: richard.purdie@linuxfoundation.org
To: mingli.yu@windriver.com, openembedded-core@lists.openembedded.org
Date: Mon, 15 Apr 2019 08:59:29 +0100
In-Reply-To: <1555314041-117426-1-git-send-email-mingli.yu@windriver.com>
References: <23562ca03db97ef41bbb2e6365ecde4bd715438d.camel@linuxfoundation.org>
	<1555314041-117426-1-git-send-email-mingli.yu@windriver.com>
User-Agent: Evolution 3.32.1-2 
MIME-Version: 1.0
Subject: Re: [PATCH v2] nettle: fix ptest failure
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
X-List-Received-Date: Mon, 15 Apr 2019 07:59:31 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Mon, 2019-04-15 at 15:40 +0800, mingli.yu@windriver.com wrote:
> ---- a/testsuite/dlopen-test.c	2016-10-01 00:28:38.000000000
> -0700
> -+++ b/testsuite/dlopen-test.c	2017-10-13 11:08:57.227572860
> -0700
> -@@ -9,7 +9,7 @@
> +diff --git a/testsuite/dlopen-test.c b/testsuite/dlopen-test.c
> +index 99d3535..92de9f8 100644
> +--- a/testsuite/dlopen-test.c
> ++++ b/testsuite/dlopen-test.c
> +@@ -9,7 +9,9 @@ int
>   main (int argc UNUSED, char **argv UNUSED)
>   {
>   #if HAVE_LIBDL
>  -  void *handle = dlopen ("../libnettle.so", RTLD_NOW);
>  +  void *handle = dlopen ("/usr/lib/libnettle.so", RTLD_NOW);
> ++  if (!handle)
> ++     handle = dlopen ("/usr/lib64/libnettle.so", RTLD_NOW);
>     int (*get_version)(void);
>     if (!handle)
>       {

What happens on a 32 bit system?

You can't hardcode a specific libdir like that!

Cheers,

Richard


