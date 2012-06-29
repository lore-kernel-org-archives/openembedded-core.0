Received: from mail.windriver.com ([147.11.1.11])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <Liezhi.Yang@windriver.com>) id 1SkTu3-0004La-Md
	for openembedded-core@lists.openembedded.org;
	Fri, 29 Jun 2012 07:38:00 +0200
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca [147.11.189.40])
	by mail.windriver.com (8.14.3/8.14.3) with ESMTP id q5T5R1xb016405
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL);
	Thu, 28 Jun 2012 22:27:01 -0700 (PDT)
Received: from [128.224.163.142] (128.224.163.142) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server id 14.1.255.0;
	Thu, 28 Jun 2012 22:27:01 -0700
Message-ID: <4FED3CA3.60605@windriver.com>
Date: Fri, 29 Jun 2012 13:26:59 +0800
From: Robert Yang <liezhi.yang@windriver.com>
User-Agent: Mozilla/5.0 (X11; Linux i686;
	rv:12.0) Gecko/20120430 Thunderbird/12.0.1
MIME-Version: 1.0
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>, Khem Raj <raj.khem@gmail.com>
References: <cover.1340773014.git.liezhi.yang@windriver.com>
	<63976f811fe5cb0c5688fe6847975499ac2d9e51.1340773014.git.liezhi.yang@windriver.com>
	<4FED0AD9.5010102@windriver.com>
	<CAMKF1spBJ-iVuHC_BxscqAw355gUMCYnh_g6zwT4oOwz91hxyA@mail.gmail.com>
In-Reply-To: <CAMKF1spBJ-iVuHC_BxscqAw355gUMCYnh_g6zwT4oOwz91hxyA@mail.gmail.com>
Cc: Zhenfeng.Zhao@windriver.com
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
X-List-Received-Date: Fri, 29 Jun 2012 05:38:02 -0000
Content-Type: text/plain; charset="ISO-8859-1"; format=flowed
Content-Transfer-Encoding: 7bit



On 06/29/2012 12:54 PM, Khem Raj wrote:
> On Thu, Jun 28, 2012 at 6:54 PM, Robert Yang<liezhi.yang@windriver.com>  wrote:
>> I've changed the cmd[BUFSIZ] to cmd[2048], which should be enough for us,
>> and
>> pushed it to the git repo again:
>
> ideally allocating a string on heap and then freeing
> it after use would fix this issue once for all.
>

Thanks Khem, but the problem is that even we use:

void *malloc(size_t size)

We should still use a constant size since the length of the command
is unknown (or not obviously known):

#else
     sprintf(cmd, "%s %s%s -f %s %s %s %s %s",
         make,
         o->install ? "INSTALLTO=" : "",
         o->install ? o->install    : "",
         o->makeFile,
         o->clean   ? "clean"      : "",
         o->rebuild ? "rebuild"    : "",
         o->install ? "install"    : "",
         o->makeArgs);

So I simply increase the size of cmd[] which is a simple fix.

// Robert

> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core
>
>


