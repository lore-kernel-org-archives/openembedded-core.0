Return-Path: <ross.burton@intel.com>
Received: from mail-io1-f68.google.com (mail-io1-f68.google.com
	[209.85.166.68])
	by mail.openembedded.org (Postfix) with ESMTP id 32B3C6C19A
	for <openembedded-core@lists.openembedded.org>;
	Fri,  9 Nov 2018 00:24:13 +0000 (UTC)
Received: by mail-io1-f68.google.com with SMTP id k17-v6so100026ioc.4
	for <openembedded-core@lists.openembedded.org>;
	Thu, 08 Nov 2018 16:24:14 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=intel-com.20150623.gappssmtp.com; s=20150623;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc; bh=pLNI/3jx/QgGRZBrZg7LTG7C6AZRdMhoGLv39ijCPQw=;
	b=sMfm0/qN2ENmB6GPbYe6MdoE6UC4QW5y2AlCryyUw2RxptctsoyFAsFp1iUfUG0qH6
	S1I1FYl7DvTMkyD8Pohh8yNs+14lONJbqEdPRjbaodCiHAqxl/I/schmgm9oMhkK2UHl
	FZ9js79g45MEtH1+rAXhFWocnNm/IaQQdLpfJ6xhmri8WGVvJp6c4z3IrdCIRSRli7+X
	Dw3aT7Jciwc7CMLeMtqkxzC4R3gXeEvZMMMR2zSECrSG1GqNYkEgxM7bdRfoBD7ZT+hP
	5jf+hFwccltTvqvV0FOz/HsDJx397CmFhDeZWbSzIo1vpOwqW5fQSHa30HdpsSWuowVq
	I25Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=pLNI/3jx/QgGRZBrZg7LTG7C6AZRdMhoGLv39ijCPQw=;
	b=UsP3vaGNEaPCEW5Bk126omWxc8ibGAAzhjg8Moh1zNS0O97XARupDxt2YUJDzDlko8
	taaXlmuS8A8bj5rN0lPJjmv84FppPO+JsvlAP322HkeXxmSEohfWGdnlNx0Yyx7gaRTz
	/ju5FoPXbjr7pyik1dBt6bmmjmh+ZsUcPxhLFHZl7ng/wdTq/lpX0LP1Tdobxv5GFURI
	O75RvYJIoX7t014d3LUqitP345/GzR2C5/1NiDYSPSuHERU9er3K7tD3ymILD1NICqk3
	1P4IXDAoG1x3aKOIozW+/1NUd8O74SQpRs9hnntaLbvdFKGZZ6IAtWyQswEp6G3SXfZp
	qhfg==
X-Gm-Message-State: AGRZ1gLKX6DxuFo0QQ0wRTWShWfhGacbiL/XTPYx3h/+gzG8ghC1t9po
	rEjjYOnWQmJtv104ZJF8JqiI3LzzACG2+tY7Ru5cbA==
X-Google-Smtp-Source: AJdET5e7UEBqceNgufYs1sySBdGG0S6kjlhLM/oe88QVX0pUAgZkJ9q1RYsJZp7mz1DSDkzXDmiIQ/qZb79Kz9jsgWU=
X-Received: by 2002:a6b:fb0a:: with SMTP id
	h10-v6mr4979724iog.270.1541723054108; 
	Thu, 08 Nov 2018 16:24:14 -0800 (PST)
MIME-Version: 1.0
References: <20181108105737.21810-1-pascal.bach@siemens.com>
In-Reply-To: <20181108105737.21810-1-pascal.bach@siemens.com>
From: "Burton, Ross" <ross.burton@intel.com>
Date: Fri, 9 Nov 2018 00:24:02 +0000
Message-ID: <CAJTo0LYaW8at7hyOGr2=qwEhSjd22YsZVKghawOjZz78iNuvNw@mail.gmail.com>
To: Pascal Bach <pascal.bach@siemens.com>
Cc: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] util-linux: make alternatives for rev and ionice work with busybox
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
X-List-Received-Date: Fri, 09 Nov 2018 00:24:13 -0000
Content-Type: text/plain; charset="UTF-8"

On Thu, 8 Nov 2018 at 10:58, Pascal Bach <pascal.bach@siemens.com> wrote:
> Busybox can provide ionice and rev. They are both installed to /bin
> The corresponding util-linux variant is installed to /usr/bin
>
> This causes the following error during the do_rootfs task:
>
> > update-alternatives: renaming ionice link from /bin/ionice to /usr/bin/ionice
> > mv: cannot stat '/bin/ionice': No such file or directory
>
> Moving the util-linux binaries to /bin avoids this error.

Isn't it simpler to just set ALTERNATIVE_LINK_NAME[ionice] =
"${base_bindir}/ionice" (so the system knows to use the same symlink
for this and busybox) instead of actually moving the binary too?

Ross

