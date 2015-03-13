Return-Path: <Liezhi.Yang@windriver.com>
Received: from mail1.windriver.com (mail1.windriver.com [147.11.146.13])
	by mail.openembedded.org (Postfix) with ESMTP id 575E96AC33
	for <openembedded-core@lists.openembedded.org>;
	Fri, 13 Mar 2015 01:51:33 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail1.windriver.com (8.14.9/8.14.5) with ESMTP id t2D1pVNd017578
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL);
	Thu, 12 Mar 2015 18:51:31 -0700 (PDT)
Received: from [128.224.162.174] (128.224.162.174) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.40) with Microsoft SMTP Server id 14.3.224.2;
	Thu, 12 Mar 2015 18:51:30 -0700
Message-ID: <550242A1.8020509@windriver.com>
Date: Fri, 13 Mar 2015 09:51:29 +0800
From: Robert Yang <liezhi.yang@windriver.com>
User-Agent: Mozilla/5.0 (X11; Linux i686;
	rv:31.0) Gecko/20100101 Thunderbird/31.4.0
MIME-Version: 1.0
To: "Burton, Ross" <ross.burton@intel.com>
References: <cover.1426140850.git.liezhi.yang@windriver.com>
	<418f6d2d447b8719d99dd9819cf13e213dc5c62a.1426140850.git.liezhi.yang@windriver.com>
	<CAJTo0LbtbqvHgJG9i6zdY+YcBU70dHJhVFE=fBX=k46ty8N8=g@mail.gmail.com>
In-Reply-To: <CAJTo0LbtbqvHgJG9i6zdY+YcBU70dHJhVFE=fBX=k46ty8N8=g@mail.gmail.com>
Cc: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 1/1] tar: set acpaths to avoid "Argument list too long" error
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
X-List-Received-Date: Fri, 13 Mar 2015 01:51:34 -0000
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Transfer-Encoding: 7bit



On 03/12/2015 08:16 PM, Burton, Ross wrote:
>
> On 12 March 2015 at 06:14, Robert Yang <liezhi.yang@windriver.com
> <mailto:liezhi.yang@windriver.com>> wrote:
>
>     +acpaths = "-I ./m4"
>
>
> Why does this only happen on tar?  Why is it safe to pass just -I ./m4 when the
> detected list that you're overriding is effectively -I ./m4 -I ./tests?

Not only tar has this problem, but also other recipes such as coreutils,
because they have many 4 files, but we have fixed that others bfore,
for example:

commit 238e9b54e228b850434f7d503870e86cfb12b775
Author: Robert Yang <liezhi.yang@windriver.com>
Date:   Sun Sep 15 09:13:12 2013 +0000

     coreutils: set acpaths to avoid "Argument list too long" error


Now I tested the build in the deep directory again, only found tar
failed, and Chong had made a patch for it.

If we don't set 'acpaths = "-I ./m4"', then it would use the absolute path,
which would be too long, here is the related code in autotools.bbclass
for acpaths:

acpaths = "default"
[snip]
         ACLOCAL="aclocal --system-acdir=${ACLOCALDIR}/"
         if [ x"${acpaths}" = xdefault ]; then
             acpaths=
             for i in `find ${S} -maxdepth 2 -name \*.m4|grep -v 'aclocal.m4'| \
                 grep -v 'acinclude.m4' | grep -v 'aclocal-copy' | sed -e 
's,\(.*/\).*$,\1,'|sort -u`; do
                 acpaths="$acpaths -I $i"
             done
         else
             acpaths="${acpaths}"
         fi

I think it's safe to set acpaths = "-I ./m4" as we had done for coreutils.

// Robert

>
> Would it be better to just make all include paths relative to ${S} when
> generating the acpaths?
>
> Ross

