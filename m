Received: from mail-gg0-f175.google.com ([209.85.161.175])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <derek.buitenhuis@gmail.com>) id 1Synvy-0000d4-Bt
	for openembedded-core@lists.openembedded.org;
	Tue, 07 Aug 2012 19:51:10 +0200
Received: by ggmq1 with SMTP id q1so3616057ggm.6
	for <openembedded-core@lists.openembedded.org>;
	Tue, 07 Aug 2012 10:39:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=message-id:date:from:user-agent:mime-version:to:subject:references
	:in-reply-to:x-enigmail-version:content-type
	:content-transfer-encoding;
	bh=tWwKudwntSgfUIHYKO+TxJGCBseD4Q/F3wjXRNzMjIw=;
	b=K6sHMqSR53gb2TQyvoD1VmJQXGpw4jyiYefmE5Q6Mx/XzyPuoD55MVuVRr/F0WLGIP
	zuQfsVgAdGtEOY0HZESVLxzoZInug582qA8fF2EpKaBPXjmaa+lxlQeCM4XwVJO5aSol
	U0Z6EbCKy0wJGZRjPjPbvbLRrNC+KEUCpLqbya4hSCE7YV45fNApHzVg9Q0Z2BZPgdY0
	+WgdEUFWp7eoGRTSggPsPjFCOEVCSeZFAF3gmYn1i1dRJ3Ukq1xEQkw70OakUBfIeNl3
	VmXOtjfPILkerV/GxV8PSCS8pUP1xyiINJE4y6Mhtnqn2pHw4FJB0Mv5RFkoQgjvrVKE
	MIyQ==
Received: by 10.42.86.20 with SMTP id s20mr12206595icl.21.1344361163557;
	Tue, 07 Aug 2012 10:39:23 -0700 (PDT)
Received: from [192.168.1.111] (S0106586d8f4832af.tb.shawcable.net.
	[24.109.142.27])
	by mx.google.com with ESMTPS id z7sm213516igb.3.2012.08.07.10.39.22
	(version=SSLv3 cipher=OTHER); Tue, 07 Aug 2012 10:39:22 -0700 (PDT)
Message-ID: <502152B8.6070100@gmail.com>
Date: Tue, 07 Aug 2012 13:39:04 -0400
From: Derek Buitenhuis <derek.buitenhuis@gmail.com>
User-Agent: Mozilla/5.0 (Windows NT 6.1; WOW64;
	rv:14.0) Gecko/20120713 Thunderbird/14.0
MIME-Version: 1.0
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
References: <1344360704-23172-1-git-send-email-yao.zhao@windriver.com>
In-Reply-To: <1344360704-23172-1-git-send-email-yao.zhao@windriver.com>
X-Enigmail-Version: 1.4.3
Subject: Re: [PATCH] cracklib, zlib: install to /lib instead of /usr/libxx
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
Reply-To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-core>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Tue, 07 Aug 2012 17:51:10 -0000
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit

On 07/08/2012 1:31 PM, Yao Zhao wrote:
> In order to fix the QA Issue for libpam which installed to /lib but
> reference /usr/libxx/libz and libcrack, install libz and libcrack
> to /lib.

OpenBSD puts libpam.so in /lib, so it seems kosher...

>  do_install() {
> -	oe_runmake DESTDIR=${D} install
> +	#libz.a installs to libdir, overwrite the env libdir
> +	#install pkgconfig to env libdir/pkgconfig
> +	oe_runmake DESTDIR=${D} pkgconfigdir="${libdir}/pkgconfig" \
> +		   libdir="${base_libdir}" install
>  }

If you're specifying --libdir when configuring, why do you need
libdir during make, as well?

- Derek


