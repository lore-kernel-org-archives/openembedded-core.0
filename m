Return-Path: <mark.hatle@windriver.com>
Received: from mail1.windriver.com (mail1.windriver.com [147.11.146.13])
	by mail.openembedded.org (Postfix) with ESMTP id DA70D7846B
	for <openembedded-core@lists.openembedded.org>;
	Tue, 12 Sep 2017 17:31:37 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail1.windriver.com (8.15.2/8.15.1) with ESMTPS id v8CHVcuV003983
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL);
	Tue, 12 Sep 2017 10:31:38 -0700 (PDT)
Received: from soho-mhatle-m.local (172.25.36.226) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server id 14.3.361.1;
	Tue, 12 Sep 2017 10:31:37 -0700
To: "Burton, Ross" <ross.burton@intel.com>
References: <20170912155906.29716-1-ross.burton@intel.com>
	<fd5d461b-2217-ef1e-9aa4-690d7508d806@windriver.com>
	<CAJTo0LYKz5w7fNe=m_5kA+iXpfRvJ9FsxR75_c+=bz4zHTVVWg@mail.gmail.com>
From: Mark Hatle <mark.hatle@windriver.com>
Organization: Wind River Systems
Message-ID: <3925ff6f-d39b-df5a-5ac0-cad5d5b72d9e@windriver.com>
Date: Tue, 12 Sep 2017 12:31:49 -0500
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.12; rv:52.0)
	Gecko/20100101 Thunderbird/52.3.0
MIME-Version: 1.0
In-Reply-To: <CAJTo0LYKz5w7fNe=m_5kA+iXpfRvJ9FsxR75_c+=bz4zHTVVWg@mail.gmail.com>
Cc: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] allarch: don't reset baselib
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
X-List-Received-Date: Tue, 12 Sep 2017 17:31:38 -0000
Content-Type: text/plain; charset="utf-8"
Content-Language: en-US
Content-Transfer-Encoding: 8bit

On 9/12/17 11:34 AM, Burton, Ross wrote:
> On 12 September 2017 at 17:28, Mark Hatle <mark.hatle@windriver.com
> <mailto:mark.hatle@windriver.com>> wrote:
> 
>     On 9/12/17 10:59 AM, Ross Burton wrote:
>     > allarch currently resets baselib to "lib" in an attempt to keep allarch recipes
>     > uniform.  However if the real value for $baselib is actually needed, for example
>     > in a multilib environment where $baselib is lib64 for standard binaries and the
>     > allarch package is using postinst intercepts which need to know the real value
>     > of $libdir, then a non-existant or incorrect $libdir will be used.
>     >
>     > Real world example: liberation-fonts is allarch and inherits fontcache, which
>     > uses a postinst intercept to run fc-cache inside qemu-user.  In a multilib
>     > configuration where normal libdir=/usr/lib64 and lib32 libdir=/usr/lib qemu will
>     > try running a 64-bit fc-cache with a 32-bit ld-linux, and predicatably the
>     > binary crashes.
> 
>     This still won't work right.  If we put an allarch package in a configuration
>     that can be either 32-bit or 64-bit (which is the point of allarch), then how
>     will it know which arch this magic script is running on?
> 
>     It sounds to me like the way the script is running needs to be fixed (and/or
>     qemu needs to be fixed).   Calls to QEMU should inherit the matching system
>     envrionment, not assume an environment from the post-install scripts.
> 
> 
> There's several problems, yes.  qemu needs to handle this more gracefully, but
> it's clearly being told by the postinst-intercept framework to run a binary in
> rootfs/usr/bin (64-bit) using libraries in rootfs/usr/lib (32-bit).  By not
> resetting baselib at least allarch packages think libdir is the "native" libdir,
> not whatever /usr/lib happens to be.

The call to qemu really should not be embedded into the postinst-intercept
script.  The framework itself is what should 'know' what it is doing and deal
with it.  The package can provide hints.. perhaps something like:

call-qemu <arch> <command>

Then the postinst stuff would implement the call-qemu 'function' (wrapper or
whatever) that would do the right thing for a given arch specified.

> I guess the true solution is for the recipes to not need to know the library
> path.  Not sure how to do that yet though...
> 
> Also its interesting that nobody else noticed this: multilib images that
> installed fonts were segfaulting in rootfs...

If the segfault is causing the postinst to exit w/ an error (non-0) then it's
likely re-running on the target itself (and thus working).  If not, ugh.

I don't have a good answer how to resolve this 'right now' with the time we have.

--Mark

