Received: from mail1.windriver.com ([147.11.146.13])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <Liezhi.Yang@windriver.com>) id 1SkUtH-0006A6-Mf
	for openembedded-core@lists.openembedded.org;
	Fri, 29 Jun 2012 08:41:16 +0200
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca [147.11.189.40])
	by mail1.windriver.com (8.14.3/8.14.3) with ESMTP id q5T6UIM0020454
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL);
	Thu, 28 Jun 2012 23:30:18 -0700 (PDT)
Received: from [128.224.163.142] (128.224.163.142) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server id 14.1.255.0;
	Thu, 28 Jun 2012 23:30:17 -0700
Message-ID: <4FED4B77.2090107@windriver.com>
Date: Fri, 29 Jun 2012 14:30:15 +0800
From: Robert Yang <liezhi.yang@windriver.com>
User-Agent: Mozilla/5.0 (X11; Linux i686;
	rv:12.0) Gecko/20120430 Thunderbird/12.0.1
MIME-Version: 1.0
To: Khem Raj <raj.khem@gmail.com>
References: <cover.1340773014.git.liezhi.yang@windriver.com>
	<63976f811fe5cb0c5688fe6847975499ac2d9e51.1340773014.git.liezhi.yang@windriver.com>
	<4FED0AD9.5010102@windriver.com>
	<CAMKF1spBJ-iVuHC_BxscqAw355gUMCYnh_g6zwT4oOwz91hxyA@mail.gmail.com>
	<4FED3CA3.60605@windriver.com>
	<CAMKF1sp_BL7R9PZgTnZXh4y9Rp0MdFUpeyGqfbV5He4XJqkLwQ@mail.gmail.com>
In-Reply-To: <CAMKF1sp_BL7R9PZgTnZXh4y9Rp0MdFUpeyGqfbV5He4XJqkLwQ@mail.gmail.com>
Cc: Zhenfeng.Zhao@windriver.com,
	Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 2/2] icu 3.6: do_install failed: Segmentation fault
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
X-List-Received-Date: Fri, 29 Jun 2012 06:41:16 -0000
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit



On 06/29/2012 02:06 PM, Khem Raj wrote:
> On Thu, Jun 28, 2012 at 10:26 PM, Robert Yang<liezhi.yang@windriver.com>  wrote:
>> We should still use a constant size since the length of the command
>> is unknown (or not obviously known):
>
> thats the point. Cant you use srtlen(cmd) ?
>

I'm afraid not, as the code shows below, we should strlen()
each component of the cmd:

     sprintf(cmd, "%s %s%s -f %s %s %s %s %s",
         make,
         o->install ? "INSTALLTO=" : "",
         o->install ? o->install    : "",
         o->makeFile,
         o->clean   ? "clean"      : "",
         o->rebuild ? "rebuild"    : "",
         o->install ? "install"    : "",
         o->makeArgs);

and this is only the part for linux os, it still has similar parts for
U_WINDOWS and OS400 (the component are different), if we strlen() each
one of them, that would make it complicated. the icu pkg does use many
malloc() in the other part of code, but it uses the char array here,
I think that maybe this is the reason.

// Robert

>


