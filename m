Received: from mail-pd0-f174.google.com ([209.85.192.174])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <niqingliang2003@gmail.com>) id 1USzqB-0002V9-49
	for openembedded-core@lists.openembedded.org;
	Fri, 19 Apr 2013 03:10:45 +0200
Received: by mail-pd0-f174.google.com with SMTP id p12so1892523pdj.19
	for <openembedded-core@lists.openembedded.org>;
	Thu, 18 Apr 2013 17:52:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=x-received:from:to:cc:subject:date:message-id:user-agent
	:in-reply-to:references:mime-version:content-transfer-encoding
	:content-type; bh=B9B0XIyZxtI1VyHFLuRrQJS5aXGPYoE9LrsBSDltD9E=;
	b=CGyR5AydZdvL1kKQrIJBMQxBAPzw45ySxbtiqctMyVtz+xNmLcjg6UNniNK+05jfhv
	4cIrEB2BX8TrF6i0hiI/KP1hI+ezoLwWcXSrd9bLpaNPh+nrL4PiokOzyQtPrIkRqD6T
	8MdEuwo1gTnhpS4YwZmh/oVnacGI4U7LBJkQ77OfwzxKiI7AMyU9h9lSUVnFl419rscy
	uoS2uBhGg1eShkOWKlRZqNi7IVWE1kvP9Wk6R9aOTVB9O2ELbYMlYpVGdleJwIFUNtDN
	qi+xnDQWI1vUPE810+lQMc6O1bZ1OrGxLHTcw5D93Ny06H4I1g1+9BltcniihTQavTp3
	y7Pg==
X-Received: by 10.67.4.167 with SMTP id cf7mr2647007pad.62.1366332760622;
	Thu, 18 Apr 2013 17:52:40 -0700 (PDT)
Received: from yiqingliang-pc.localnet ([121.229.159.24])
	by mx.google.com with ESMTPS id to7sm12635749pab.0.2013.04.18.17.52.37
	(version=TLSv1.2 cipher=ECDHE-RSA-RC4-SHA bits=128/128);
	Thu, 18 Apr 2013 17:52:39 -0700 (PDT)
From: Yi Qingliang <niqingliang2003@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Fri, 19 Apr 2013 08:49:27 +0800
Message-ID: <2526326.CAbek543yF@yiqingliang-pc>
User-Agent: KMail/4.10.2 (Linux/3.8.7-1-ARCH; KDE/4.10.2; x86_64; ; )
In-Reply-To: <41F644AD-691F-443B-A267-8562E5DDC3BC@gmail.com>
References: <alpine.DEB.2.02.1304181219550.8010@oneiric>
	<alpine.DEB.2.02.1304181250070.20260@oneiric>
	<41F644AD-691F-443B-A267-8562E5DDC3BC@gmail.com>
MIME-Version: 1.0
Subject: Re: [PATCH] local.conf.sample: Have comments ready to go for quad-core (4 -> 8).
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-core>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Fri, 19 Apr 2013 01:10:52 -0000
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="us-ascii"

On Thursday, April 18, 2013 09:57:16 PM Elvis Dowson wrote:
> On Apr 18, 2013, at 8:51 PM, "Robert P. J. Day" <rpjday@crashcourse.ca> 
wrote:
> > On Thu, 18 Apr 2013, Enrico Scholz wrote:
> >> "Robert P. J. Day" <rpjday-L09J2beyid0N/H6P543EQg@public.gmane.org>
> >> 
> >> writes:
> >>> Have default, commented values for parallelism reflect quad-core
> >>> hosts.
> >> 
> >> fwiw, I use
> >> 
> >> PARALLEL_MAKE = "\
> >> 
> >>  -j ${@int(os.sysconf(os.sysconf_names['SC_NPROCESSORS_ONLN'])) * 2} \
> >>  -l ${@int(os.sysconf(os.sysconf_names['SC_NPROCESSORS_ONLN'])) *
> >>  150/100} \
> >> 
> >> "
> >> 
> >> BB_NUMBER_THREADS ?= "\
> >> 
> >>  ${@int(os.sysconf(os.sysconf_names['SC_NPROCESSORS_ONLN'])) * 150/100}"
> >> 
> >> which adjusts parallelism automatically.
> >> 
> >  i'd be perfectly fine with that, too, if someone wants to put that
> > 
> > in instead.
> 
> I've noticed that on a quad-core machine (i7) the best setting is to leave
> it at 6 for BB_NUMBER_THREADS and PARALLEL_MAKE.
maybe we need consider the hyper-threading.

	CPU_PROC_NUM="`grep "^processor" /proc/cpuinfo | sort -u | wc -l`"
	CPU_CORE_NUM="`grep "^core id" /proc/cpuinfo | sort -u | wc -l`"

> 8, 16, etc don't have any discernable impact, perhaps save 30 to 40 seconds
> off a build. The 3.5Ghz standard CPU frequency can be over-clocked to as
> high as 4.5GHz, but I tested it out at 4.2Ghz and 3.8Ghz, and the
> difference was only 2 to 3 minutes between 3.8GHz and 4.2GHz over-clocked,
> so I currently leave it at 3.8GHz over-clocked.
> 
> I'm using two SSDs in a RAID 0 striped configuration, and build times is
> around 22 minutes for a Zynq-7-ZC702 build for core-image-minimal.
> 
> Elvis Dowson
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core
-- 
Nanjing Jilong
Yi Qingliang
niqingliang2003@gmail.com


