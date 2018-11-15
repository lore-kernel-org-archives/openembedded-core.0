Return-Path: <richard.purdie@linuxfoundation.org>
Received: from dan.rpsys.net (5751f4a1.skybroadband.com [87.81.244.161])
	by mail.openembedded.org (Postfix) with ESMTP id 3D84B6C20B
	for <openembedded-core@lists.openembedded.org>;
	Thu, 15 Nov 2018 19:10:09 +0000 (UTC)
Received: from hex ([192.168.3.34]) (authenticated bits=0)
	by dan.rpsys.net (8.15.2/8.15.2/Debian-10) with ESMTPSA id
	wAFJA8ev032288
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256
	verify=NOT); Thu, 15 Nov 2018 19:10:09 GMT
Message-ID: <ea765026295a0691446d7afe29b2be2c6c0f0c43.camel@linuxfoundation.org>
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Mike Crowe <mac@mcrowe.com>, openembedded-core@lists.openembedded.org
Date: Thu, 15 Nov 2018 19:10:08 +0000
In-Reply-To: <20181115120016.29814-1-mac@mcrowe.com>
References: <20181115120016.29814-1-mac@mcrowe.com>
X-Mailer: Evolution 3.28.5-0ubuntu0.18.04.1 
Mime-Version: 1.0
X-Virus-Scanned: clamav-milter 0.100.2 at dan
X-Virus-Status: Clean
Subject: Re: [PATCH] glibc: Package AArch64 dynamic loader symlink correctly with usrmerge
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
X-List-Received-Date: Thu, 15 Nov 2018 19:10:11 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Thu, 2018-11-15 at 12:00 +0000, Mike Crowe wrote:
> When using usrmerge, the compatibility dynamic loader symlink created
> in do_install_append_aarch64 ends up in /usr/lib rather than /lib.
> This means that the path added to libc_baselibs needs to be altered
> to match.
> 
> It's also necessary to tweak do_poststash_install_cleanup to not fail
> when the symlink exists. I'm not entirely sure that the fix I've
> applied here is the best one, but it does appear to work.

I'm afraid I really don't like this. Its creating a twisted web of
logic which is going to be hard to maintain as the code is trying to do
too many different things.

In particular, hardcoding "lib64" is usually a bad sign, as is swapping
/lib for nonarch_base_libdir since whilst those happen to be similar,
they do mean different things here. Its pure luck that usrmerge happens
to end up doing the right thing and it will work until someone else
wants to do something interesting with the layout and we can complicate
this even more.

I'm hoping there is a better way to address this...

Cheers,

Richard


