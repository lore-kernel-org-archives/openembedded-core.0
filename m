Return-Path: <bunk@stusta.de>
Received: from mail.stusta.mhn.de (mail.stusta.mhn.de [141.84.69.5])
	by mail.openembedded.org (Postfix) with ESMTP id C752D608AF
	for <openembedded-core@lists.openembedded.org>;
	Sat, 29 Feb 2020 09:21:08 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1])
	by mail.stusta.mhn.de (Postfix) with ESMTPSA id 48V19Z2sdwz4S;
	Sat, 29 Feb 2020 10:21:05 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=stusta.de;
	s=default; t=1582968066;
	bh=5fazZK6VDx9Vd9PYvTZi/C4ogj2qSVYmd1Vrrv48vio=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=d4uisrzq/nXEvchAwIGudlVWlvuP6qHXFloMtSs+0FSrAQrgM9I7fVZVm2nzOYaYM
	jjicHxOD1wdwfvJLxoViHyoDx/YbYfNE9r1CuUBWJwO1/dSO40A0LwOj48g140/Hbm
	IAPKeaaY1sPAADarmTydP5dsmUNMBjyCTVUynPXqef/68YS7AtD/oxflI/sBk762xt
	uFdl+qygnPcEWeKEPsqZHf/CEJdduZFgYn/0/zU5bcfk1fUrnKnBGkLKHkPe9x+992
	A6Ol5woGDfUh4ovrt1eZcjEsn6RR20Fa5duz5lf1+ED6sJC9hAmKSktCaylrIedHZF
	E1LpWooHsKQYMP8OCZgHlyQq1CzCXBoj03xMlqWn0Xpu+eGNImXHAhqkEHnBgKNu6k
	CVXN+zwxsVmveSDeYmOnAKnsy2s+5RVIv1RL8vSNydmndTZ/m448API5wcO/W3i852
	gOfpmpn6RAEkQwIdQqrm7OSCK1XQy2Kg+85aTemFNncTnVhbujsH9kA5+5JBVKb52P
	daagaCwm+UuE5qSnwOR9cfV2FqV9e0mqpQXLOHWf4W6e30FQIkdEi97kq1/HzPt2Wg
	WGu7j9bUEcVAyeMVXkiinnwCTnqrLAqLsPwYsqG1FZUo1xnPxaKP4teIMkrUL8y2Yw
	NQg+glSO7Gy1u2S/5g9du65k=
Date: Sat, 29 Feb 2020 11:21:03 +0200
From: Adrian Bunk <bunk@stusta.de>
To: Victor Kamensky <kamensky@cisco.com>
Message-ID: <20200229092103.GA27521@localhost>
References: <20200229075546.12713-1-kamensky@cisco.com>
MIME-Version: 1.0
In-Reply-To: <20200229075546.12713-1-kamensky@cisco.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
Cc: Jens Rehsack <sno@netbsd.org>, openembedded-core@lists.openembedded.org
Subject: Re: [PATCH] make: disable use of posix_spawn on mips
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
X-List-Received-Date: Sat, 29 Feb 2020 09:21:09 -0000
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline

On Fri, Feb 28, 2020 at 11:55:46PM -0800, Victor Kamensky via Openembedded-core wrote:
> After make-4.3 migration child_execute_job function started
> using posix_spawn function, which happens to be broken on mips.
> 
> It manifests itself as when make executed by root, it switches
> real user id to wrong value because of some issues with direct
> setresuid system call done in glibc __spawni_child function
> through inline assemble and/or gcc compiling it produces wrong
> code. I.e instead of passing -1 posix_spawn function incorrectly
> passes 127 as ruid. Subsequently job started by make can fail
> with permission issue because they run under wrong user.

Thanks for looking into this.

> For now workaround is used by explicitly disabling posix_spawn
> call use by make on mips through configure variable.

The proper fix would be to upgrade to the latest glibc 2.31 branch,
which has backported the fixes for the bug [1] on mips/risc-v/microblaze.

cu
Adrian

[1] https://sourceware.org/bugzilla/show_bug.cgi?id=25523

