Return-Path: <raj.khem@gmail.com>
Received: from mail-vk0-f66.google.com (mail-vk0-f66.google.com
	[209.85.213.66])
	by mail.openembedded.org (Postfix) with ESMTP id 5118460068
	for <openembedded-core@lists.openembedded.org>;
	Sun, 22 Jan 2017 04:00:43 +0000 (UTC)
Received: by mail-vk0-f66.google.com with SMTP id t8so8838354vke.0
	for <openembedded-core@lists.openembedded.org>;
	Sat, 21 Jan 2017 20:00:44 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=f53A+lS57yNIAJYIr3wz1uvbbQzoe80xlH7z9Z1vhhk=;
	b=YAfzl1a1bSAzaIRs+URkftbdgbfwAfdj0jsk6bCehUtMnihbghua5ky+RRQaZMlJJd
	jzEESQ1sExw3HLe86iQ7t5El4pebizLGBNaWiaN1eeZ1ofo+cJEEpEiuD9o/cBjMpfnp
	SaiRZrxz8XmvCh7DvHmJOtPZu3xdCrbtqGW425DdfezwCudZHurrmFy4X1o/ckleGrwV
	7nMn0w+1duMSeb6eniCaVngnfEuR5o++xTMGkMD4hxg1ZuayoLMPv9OpHeBy/T6vMMBl
	duQKz6Zwzd8P7i5ytQu/5lBAQsKT2gqrGx+xh+ZnYhUjusXFsjOiCkSdeaYRTZrqcuQz
	v+9Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=f53A+lS57yNIAJYIr3wz1uvbbQzoe80xlH7z9Z1vhhk=;
	b=ssTgMHTw399a2oV94LdM2dlYODBoaHTqyeJ6ylSg8HDrrlIL/roE61do0hHUEjcnqw
	YeWXJM5tQRykHBIopVb1340K73j2JvbQzNcJjDJqzOXMTOo6xq29HeXH/UMxJoFbGult
	gXTF7p7SJwibDvvPSwYI9KSz2rwy9RElRTUmCSmEWvZTB4hO7BUweB8dIYxSnB4WvIuE
	SxC1X1oDc9yEKmw+sMAjykyiNZat1oS8NvlMwgifLQxGca+8Y193vFPkXQgCpkjABwyv
	6MkYHGJjhU5D07k6uMsWPzcRHjvCDE1kfdjG5e8ESgTs7eHPb5544AFwu1vKsGDpP8jO
	0N/g==
X-Gm-Message-State: AIkVDXJFHXbGJjfD9TFdGYqxSU4carpoxnaYFFDzs+zlOpXz6IVt+39KQYUON37u31t+BmCk3g5odrUsY+AdPQ==
X-Received: by 10.31.153.8 with SMTP id b8mr10596404vke.140.1485057643833;
	Sat, 21 Jan 2017 20:00:43 -0800 (PST)
MIME-Version: 1.0
Received: by 10.159.48.222 with HTTP; Sat, 21 Jan 2017 20:00:13 -0800 (PST)
In-Reply-To: <1484924046.23233.126.camel@intel.com>
References: <cover.bbc01c1227afdba3edc41dc7d7356f56e51be400.1484921498.git-series.patrick.ohly@intel.com>
	<ef36ec5c696cc690af21e560c82924e5dab51a1e.1484921498.git-series.patrick.ohly@intel.com>
	<1484924046.23233.126.camel@intel.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Sat, 21 Jan 2017 20:00:13 -0800
Message-ID: <CAMKF1spnwmo4cLdnaA1p-fvscpYm2WQQM3vEkOeHqinpwvn-bQ@mail.gmail.com>
To: Patrick Ohly <patrick.ohly@intel.com>
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH v4 02/12] acpica: work around flex 2.6.2 code generation issue
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
X-List-Received-Date: Sun, 22 Jan 2017 04:00:44 -0000
Content-Type: text/plain; charset=UTF-8

On Fri, Jan 20, 2017 at 6:54 AM, Patrick Ohly <patrick.ohly@intel.com> wrote:
> On Fri, 2017-01-20 at 15:12 +0100, Patrick Ohly wrote:
>> Without this patch, linking fails with a missing implementation of
>> yy_scan_string. This looks like a regression in flex, because 2.6.0 generated
>> different code that called PrParser_scan_string
>> resp. DtParser_scan_string.
>>
>> Working around that in acpica until this is better understood or fixed
>> in flex is the easiest solution for now.
>
> It turned out that flex 2.6.3 has a fix for the problem. But the github
> issue tracker for flex has several people who reported issues with 2.6.3
> (affecting gdb, binutils, grub) that we probably should wait a bit
> before trying to update to that release.
>
> --
> Best Regards, Patrick Ohly
>
> The content of this message is my personal opinion only and although
> I am an employee of Intel, the statements I make here in no way
> represent Intel's position on the issue, nor am I authorized to speak
> on behalf of Intel on this matter.
>

I am seeing issues with qtwebkit as well.

error: 'yyset_column' was not declared in
 this scope

Similar errors for 'yyset_lineno' 'yylex' 'yylex_init_extra'
'yyrestart' 'yylex_destroy'

Haven't really dug into details but it seems to be caused by update to 2.6.2

