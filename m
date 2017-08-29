Return-Path: <richard.purdie@linuxfoundation.org>
Received: from dan.rpsys.net (5751f4a1.skybroadband.com [87.81.244.161])
	by mail.openembedded.org (Postfix) with ESMTP id DC1D96AC4B
	for <openembedded-core@lists.openembedded.org>;
	Tue, 29 Aug 2017 10:33:00 +0000 (UTC)
Received: from hex ([192.168.3.34]) (authenticated bits=0)
	by dan.rpsys.net (8.15.2/8.15.2/Debian-3) with ESMTPSA id
	v7TAWvFs028029
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128
	verify=NOT); Tue, 29 Aug 2017 11:32:58 +0100
Message-ID: <1504002777.32591.325.camel@linuxfoundation.org>
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Alexander Kanavin <alexander.kanavin@linux.intel.com>,
	openembedded-core@lists.openembedded.org
Date: Tue, 29 Aug 2017 11:32:57 +0100
In-Reply-To: <20170829095532.7446-1-alexander.kanavin@linux.intel.com>
References: <20170829095532.7446-1-alexander.kanavin@linux.intel.com>
X-Mailer: Evolution 3.18.5.2-0ubuntu3.2 
Mime-Version: 1.0
X-Greylist: Sender succeeded SMTP AUTH, not delayed by milter-greylist-4.5.11
	(dan.rpsys.net [192.168.3.1]);
	Tue, 29 Aug 2017 11:32:59 +0100 (BST)
X-Virus-Scanned: clamav-milter 0.99.2 at dan
X-Virus-Status: Clean
Subject: Re: [PATCH] gettext.bbclass: do not add virtual/gettext to DEPENDS
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
X-List-Received-Date: Tue, 29 Aug 2017 10:33:01 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit

On Tue, 2017-08-29 at 12:55 +0300, Alexander Kanavin wrote:
> gettext has a notoriously slow configuration step, and so in my
> testing this  greatly speeds up building core-image-minimal: from
> 21m36s to 19m2s (empty sstate and tmp, but pre-populated downloads).
> 
> I have also built world, and core-image-sato to make sure it doesn't
> break or modify the build, and there is no difference whatsoever in
> packages and images content. Target gettext not seems to be used for
> anything.
> 
> Also fix up insane.bbclass to remove the corresponding QA check.

I like this idea, one small question below...

> diff --git a/meta/classes/insane.bbclass
> b/meta/classes/insane.bbclass
> index b7177c9b329..a2ec466775f 100644
> --- a/meta/classes/insane.bbclass
> +++ b/meta/classes/insane.bbclass
> @@ -1183,9 +1183,9 @@ Rerun configure task after fixing this.""")
>          elif bb.data.inherits_class('cross-canadian', d):
>              gt = "nativesdk-gettext"
>          else:
> -            gt = "virtual/" + ml + "gettext"
> +            gt = None

Should this be gettext-native?

>          deps = bb.utils.explode_deps(d.getVar('DEPENDS') or "")
> -        if gt not in deps:
> +        if gt is not None and gt not in deps:
>              for config in configs:
>                  gnu = "grep \"^[[:space:]]*AM_GNU_GETTEXT\" %s
> >/dev/null" % config
>                  if subprocess.call(gnu, shell=True) == 0:

Cheers,

Richard

