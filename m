Return-Path: <alexander.kanavin@linux.intel.com>
Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
	by mail.openembedded.org (Postfix) with ESMTP id 2275378538
	for <openembedded-core@lists.openembedded.org>;
	Thu, 16 Nov 2017 10:14:27 +0000 (UTC)
Received: from orsmga001.jf.intel.com ([10.7.209.18])
	by fmsmga101.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
	16 Nov 2017 02:14:29 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.44,402,1505804400"; 
   d="scan'208";a="5631096"
Received: from kanavin-desktop.fi.intel.com (HELO [10.237.68.161])
	([10.237.68.161])
	by orsmga001.jf.intel.com with ESMTP; 16 Nov 2017 02:14:28 -0800
To: Martin Kelly <mkelly@xevo.com>, openembedded-core@lists.openembedded.org
References: <20171115175303.3557-1-mkelly@xevo.com>
	<20171115175303.3557-2-mkelly@xevo.com>
From: Alexander Kanavin <alexander.kanavin@linux.intel.com>
Message-ID: <cb3f9315-d599-4f65-59c4-7b016d0a9614@linux.intel.com>
Date: Thu, 16 Nov 2017 12:14:43 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:52.0) Gecko/20100101
	Thunderbird/52.4.0
MIME-Version: 1.0
In-Reply-To: <20171115175303.3557-2-mkelly@xevo.com>
Subject: Re: [PATCH 1/1] meson: export native env only for native build
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
X-List-Received-Date: Thu, 16 Nov 2017 10:14:28 -0000
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit

On 11/15/2017 07:53 PM, Martin Kelly wrote:
> Although the meson crossfile should take care of setting the right cross
> environment for a target build, meson slurps any set CFLAGS, CXXFLAGS,
> LDFLAGS, and CPPFLAGS from the environment and injects them into the
> build (see mesonbuild/environment.py:get_args_from_envvars for details).
> 
> This means that we are seeing native CFLAGS, CXXFLAGS, LDFLAGS, and
> CPPFLAGS in the target build, which is wrong and causes build failures
> when target and native have libraries in common (the linker gets
> confused and bails).
> 
> That said, we *do* need to set certain vars for all builds so that meson
> can find the right build tools. Without this, meson will fail during its
> sanity checking step because it will determine the build tools to be
> unrunnable since they output target instead of native artifacts.
> 
> The solution to all of this is to set CC, CXX, LD, and AR globally to
> the native tools while setting the other native vars *only* for the
> native build. For target builds, these vars will get overridden by the
> cross file as we expect.

Thanks; I will add this patch to my branch (so you get the credit for 
it). There's still a few failures to sort first though, discovered by AB 
(see Ross' email).

Alex

