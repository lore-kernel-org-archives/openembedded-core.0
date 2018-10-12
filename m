Return-Path: <richard.purdie@linuxfoundation.org>
Received: from dan.rpsys.net (5751f4a1.skybroadband.com [87.81.244.161])
	by mail.openembedded.org (Postfix) with ESMTP id 1D04779B53
	for <openembedded-core@lists.openembedded.org>;
	Fri, 12 Oct 2018 07:33:45 +0000 (UTC)
Received: from hex ([192.168.3.34]) (authenticated bits=0)
	by dan.rpsys.net (8.15.2/8.15.2/Debian-10) with ESMTPSA id
	w9C7Xha4015791
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256
	verify=NOT); Fri, 12 Oct 2018 08:33:45 +0100
Message-ID: <7fe513b6dcb00e887b7fce35e25ff74cff263070.camel@linuxfoundation.org>
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Joshua Watt <jpewhacker@gmail.com>,
	openembedded-core@lists.openembedded.org
Date: Fri, 12 Oct 2018 08:33:43 +0100
In-Reply-To: <20181011180843.13983-1-JPEWhacker@gmail.com>
References: <20181011180843.13983-1-JPEWhacker@gmail.com>
X-Mailer: Evolution 3.28.5-0ubuntu0.18.04.1 
Mime-Version: 1.0
X-Virus-Scanned: clamav-milter 0.100.1 at dan
X-Virus-Status: Clean
Subject: Re: [PATCH] initscripts: populate-volatiles: Speed up processing
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
X-List-Received-Date: Fri, 12 Oct 2018 07:33:46 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Thu, 2018-10-11 at 13:08 -0500, Joshua Watt wrote:
> Checking the requirements for each volatiles file in the
> populate-volatiles script can be very slow when there are a large
> number
> of volatiles files, easily consuming over 80% of the processing time.
> These checks don't usually uncover any problems so concatenate all
> the
> volatiles files together and process them as one large file for a
> "fast
> path" option. This ensures that the penalty for checking the
> requirements is only incurred once. In the event that checking the
> requirements for the unified file fails, fall back to the slow
> process
> of checking each one individually so that the offending one can be
> skipped.
> 
> [YOCTO #12949]
> 
> Signed-off-by: Joshua Watt <JPEWhacker@gmail.com>

As yet I little evidence for it but I think this caused: 


https://autobuilder.yoctoproject.org/typhoon/#/builders/35/builds/69/steps/7/logs/step6c

You can see the config in:


https://autobuilder.yoctoproject.org/typhoon/#/builders/35/builds/69/steps/7/logs/stdio

the key bits for 6c are:

DISTRO_FEATURES_append = ' systemd'
VIRTUAL-RUNTIME_init_manager = 'sysvinit'

Cheers,

Richard


