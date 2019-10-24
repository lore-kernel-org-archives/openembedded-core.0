Return-Path: <jean-marie.lemetayer@savoirfairelinux.com>
Received: from mail.savoirfairelinux.com (mail.savoirfairelinux.com
	[208.88.110.44])
	by mail.openembedded.org (Postfix) with ESMTP id CEAA27F9C6
	for <openembedded-core@lists.openembedded.org>;
	Thu, 24 Oct 2019 15:20:26 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by mail.savoirfairelinux.com (Postfix) with ESMTP id 8FD659C0336;
	Thu, 24 Oct 2019 11:20:27 -0400 (EDT)
Received: from mail.savoirfairelinux.com ([127.0.0.1])
	by localhost (mail.savoirfairelinux.com [127.0.0.1]) (amavisd-new,
	port 10032)
	with ESMTP id mB9SWiQJvLAy; Thu, 24 Oct 2019 11:20:17 -0400 (EDT)
Received: from localhost (localhost [127.0.0.1])
	by mail.savoirfairelinux.com (Postfix) with ESMTP id 7168B9C041A;
	Thu, 24 Oct 2019 11:20:17 -0400 (EDT)
X-Virus-Scanned: amavisd-new at mail.savoirfairelinux.com
Received: from mail.savoirfairelinux.com ([127.0.0.1])
	by localhost (mail.savoirfairelinux.com [127.0.0.1]) (amavisd-new,
	port 10026)
	with ESMTP id cwEBeHAdklYl; Thu, 24 Oct 2019 11:20:17 -0400 (EDT)
Received: from mail.savoirfairelinux.com (mail.savoirfairelinux.com
	[192.168.48.237])
	by mail.savoirfairelinux.com (Postfix) with ESMTP id 469AF9C0336;
	Thu, 24 Oct 2019 11:20:17 -0400 (EDT)
Date: Thu, 24 Oct 2019 11:20:17 -0400 (EDT)
From: Jean-Marie LEMETAYER <jean-marie.lemetayer@savoirfairelinux.com>
To: Richard Purdie <richard.purdie@linuxfoundation.org>
Message-ID: <1021438073.532839.1571930417234.JavaMail.zimbra@savoirfairelinux.com>
In-Reply-To: <dfce773cde47183486e5b58126a98190d96d4005.camel@linuxfoundation.org>
References: <20191022090353.21151-1-jean-marie.lemetayer@savoirfairelinux.com>
	<8e660284b1ece9e66eb47747213e8faafdd99655.camel@linuxfoundation.org>
	<5290bb1a-4cc8-4ed9-8f33-3c8994f06f22@herbrechtsmeier.net>
	<CANNYZj99FATCkw+6V088NkTWm3DEUAcoZaP+XBUR0xZnGeeQdw@mail.gmail.com>
	<dfce773cde47183486e5b58126a98190d96d4005.camel@linuxfoundation.org>
MIME-Version: 1.0
X-Mailer: Zimbra 8.8.11_GA_3737 (ZimbraWebClient - GC77 (Linux)/8.8.11_GA_3737)
Thread-Topic: NPM refactoring
Thread-Index: VEpe90yNwzvyovd5ib93OwWm6DOgVg==
Cc: paul eggleton <paul.eggleton@linux.intel.com>,
	Savoir-faire Linux Rennes <rennes@savoirfairelinux.com>,
	OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [RFC][PATCH 0/6] NPM refactoring
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
X-List-Received-Date: Thu, 24 Oct 2019 15:20:27 -0000
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit

Hi Richard,

On Oct 24, 2019, at 3:36 PM, Richard Purdie richard.purdie@linuxfoundation.org wrote:
> On Thu, 2019-10-24 at 14:12 +0200, Alexander Kanavin wrote:
>> On Thu, 24 Oct 2019 at 14:02, Stefan Herbrechtsmeier <
>> stefan@herbrechtsmeier.net> wrote:
>> > @Richard: What is your opinion about the per recipe dependency?
>> > Typically OE use one recipe per project. The NPM based solution
>> > handle a
>> > project and all dependencies via one recipe.
>> 
>> I don't think it's at all realistic to stick to the 'one recipe per
>> component' in node.js world. A typical 'npm install' can pull down
>> hundreds, or over a thousand dependencies, it's not feasible to have
>> a recipe for each.
>> 
>> I very much welcome a solution that uses 'npm install' in a way that
>> preserves offline builds, and integrity/reproducibility of downloads.
>> License management should be also handled by npm, and if it isn't,
>> then we need to work with the upstream to address it.
> 
> I understand however keep in mind the way this patch series has been
> going, it could end up simply forceing all processing into the do_fetch
> task.
> 
> We need determinism form the build in that building this today should
> give the same result as a build run in X years time, assuming the same
> host OS and so on, even if DL_DIR isn't populated. The state of the
> internet should not change that.
> 
> I worry about the amount of magic "npm install" has going on which
> would mean we couldn't achieve this.

I have almost finish a new version for this patchset. All network accesses are now done during the do_fetch and verified using the check_network_access function.

The npm-shrinkwrap.json file ensures that the generated tree will be reproducible. It describes the wanted dependency tree and provides an integrity check for each packages. When using this file the build is totally predictable. Of course this file is mandatory.

Regards,
Jean-Marie



