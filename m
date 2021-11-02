Return-Path: <richard.purdie@linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Message-ID: <0da700a98d7c6f915b222aefcc48646f2585f372.camel@linuxfoundation.org>
Subject: Re: [OE-core] [RFC PATCH 11/14] populate_sdk_base/images: Drop use of 'meta' class and hence do_build dependencies
From: "Richard Purdie" <richard.purdie@linuxfoundation.org>
Date: Tue, 02 Nov 2021 13:06:39 +0000
In-Reply-To: <c5a8296f-bd0b-e0db-9b1e-7f32ebd5c100@windriver.com>
References: <20210920124621.1576702-1-richard.purdie@linuxfoundation.org>
	 <20210920124621.1576702-11-richard.purdie@linuxfoundation.org>
	 <c5a8296f-bd0b-e0db-9b1e-7f32ebd5c100@windriver.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
List-id: <openembedded-core.lists.openembedded.org>
To: ChenQi <Qi.Chen@windriver.com>, openembedded-core@lists.openembedded.org

On Wed, 2021-10-27 at 10:43 +0800, ChenQi wrote:
> 
>  I like this change. However, it causes problem of 'rm_work'.
>  Now some native recipes don't get cleaned up with 'rm_work' enabled.
>  
>  e.g.
>  INHERIT += "rm_work"
>  bitbake core-image-minimal
>  A few native recipes don't get clean up such as alsa-lib-native, createrepo-
> c-native, dnf-native, etc.
>  
>  Do you have any idea how to fix it? Or should we accept the current
> situation?
>  

I think the issue is that populate_sdk is an odd task in that it doesn't run
before do_build (nor should it). rm_work will therefore not get triggered since
the class does:

addtask rm_work_all before do_build

What might work is something like:

do_populate_sdk[recrdeptask] = "do_rm_work"

but that may have some horrible side effects, I'm not sure.

Cheers,

Richard






