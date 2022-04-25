Return-Path: <richard.purdie@linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Message-ID: <749f33fad354821ee5e1b9f061aae211c252b934.camel@linuxfoundation.org>
Subject: Re: [OE-core] Git and pseudo
From: "Richard Purdie" <richard.purdie@linuxfoundation.org>
Date: Mon, 25 Apr 2022 13:51:46 +0100
In-Reply-To: <ef4b958c-8310-4b40-f671-779558228550@topic.nl>
References: 
	<1b153bce-a66a-45ee-a5c6-963ea6fb1c82.949ef384-8293-46b8-903f-40a477c056ae.6812ddf4-d065-4e4e-ad42-c48d1bca155d@emailsignatures365.codetwo.com>
	 <1b153bce-a66a-45ee-a5c6-963ea6fb1c82.0d2bd5fa-15cc-4b27-b94e-83614f9e5b38.65eda1d8-3d07-4fbe-a1d1-669c533cd0a5@emailsignatures365.codetwo.com>
	 <ef4b958c-8310-4b40-f671-779558228550@topic.nl>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
List-id: <openembedded-core.lists.openembedded.org>
To: Mike Looijmans <mike.looijmans@topic.nl>, openembedded-core@lists.openembedded.org

On Mon, 2022-04-25 at 09:40 +0200, Mike Looijmans wrote:
> Recently GIT got updated with a security fix:
> 
> https://github.blog/2022-04-12-git-security-vulnerability-announced/
> 
> 
> The problem is that this causes all "git" tasks that run within pseudo 
> (most noticably, image recipes) to fail. In many repositories, we use:
> git rev-parse --verify HEAD > /etc/revision
> 
> Or something similar to that. After the GIT update, this now fails with 
> an error like:
> 
> '''
> fatal: unsafe repository ('/home/mike/repository/path' is owned by 
> someone else)
> To add an exception for this directory, call:
> 
>      git config --global --add safe.directory /home/mike/repository/path
> '''
> 
> Apart from doing as it says, or even "git config --global --add 
> safe.directory '*'" anyone have a better idea, especially one that 
> prevents the system thinking I'm someone else (root in the case of pseudo).

https://git.yoctoproject.org/poky/commit/?id=21559199516a31c7635c5f2d874eaa4a92fff0e5

However this isn't quite enough as some things encode the path to git into build
files so the PATH change at do_install isn't enough. igt-gpu-tools via meson in
OE-Core is an example.

Cheers,

Richard

