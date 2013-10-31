Return-Path: <Rongqing.Li@windriver.com>
Received: from mail.windriver.com (mail.windriver.com [147.11.1.11])
	by mail.openembedded.org (Postfix) with ESMTP id A84C26D3BB
	for <openembedded-core@lists.openembedded.org>;
	Thu, 31 Oct 2013 00:45:11 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail.windriver.com (8.14.5/8.14.3) with ESMTP id r9V0j9JD015969
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL);
	Wed, 30 Oct 2013 17:45:09 -0700 (PDT)
Received: from [128.224.162.168] (128.224.162.168) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server id 14.2.347.0;
	Wed, 30 Oct 2013 17:45:08 -0700
Message-ID: <5271A814.3010301@windriver.com>
Date: Thu, 31 Oct 2013 08:45:08 +0800
From: Rongqing Li <rongqing.li@windriver.com>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:17.0) Gecko/20130623 Thunderbird/17.0.7
MIME-Version: 1.0
To: Richard Purdie <richard.purdie@linuxfoundation.org>
References: <1383022443-4171-1-git-send-email-rongqing.li@windriver.com>
	<CAMKF1sqT+NZkhg=74iXJtZUKSiTu8HXzPbQbPRO881LzzDWsbA@mail.gmail.com>
	<1383129826.25877.16.camel@ted>
In-Reply-To: <1383129826.25877.16.camel@ted>
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] pseudo: fix library path in FILES_${PN}
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
X-List-Received-Date: Thu, 31 Oct 2013 00:45:13 -0000
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit



On 10/30/2013 06:43 PM, Richard Purdie wrote:
> On Tue, 2013-10-29 at 16:03 -0700, Khem Raj wrote:
>> On Mon, Oct 28, 2013 at 9:54 PM,  <rongqing.li@windriver.com> wrote:
>>> -FILES_${PN} = "${libdir}/pseudo/lib*/libpseudo.so ${bindir}/* ${localstatedir}/pseudo ${prefix}/var/pseudo"
>>> -FILES_${PN}-dbg += "${libdir}/pseudo/lib*/.debug"
>>> +FILES_${PN} = "${prefix}/lib/pseudo/lib*/libpseudo.so ${bindir}/* ${localstatedir}/pseudo ${prefix}/var/pseudo"
>>> +FILES_${PN}-dbg += "${prefix}/lib/pseudo/lib*/.debug"
>>> +INSANE_SKIP_${PN} += "libdir"
>>> +INSANE_SKIP_${PN}-dbg += "libdir"
>>> +
>>
>> may be you can use ${nonarch_base_libdir} instead of hardcoding
>
> It is pointless using that expression if the path is hardcoded into the
> source though, which in this case, I suspect it is :(
>
> Cheers,


It is true, if we use ${nonarch_base_libdir}, we need to change the all:

lirq@lirq-OptiPlex-780:/home/prj/oe-core/meta/recipes-devtools/pseudo$ 
grep "${prefix}/lib" ./ -r
./pseudo.inc:FILES_${PN} = "${prefix}/lib/pseudo/lib*/libpseudo.so 
${bindir}/* ${localstatedir}/pseudo ${prefix}/var/pseudo"
./pseudo.inc:FILES_${PN}-dbg += "${prefix}/lib/pseudo/lib*/.debug"
./pseudo.inc:	  ${S}/configure ${PSEUDO_EXTRA_OPTS} --prefix=${prefix} 
--libdir=${prefix}/lib/pseudo/lib${SITEINFO_BITS} 
--with-sqlite-lib=${baselib} 
--with-sqlite=${STAGING_DIR_TARGET}${exec_prefix} --cflags="${CFLAGS}" 
--bits=${SITEINFO_BITS} --enable-static-sqlite --without-rpath
./pseudo.inc:	  ${S}/configure ${PSEUDO_EXTRA_OPTS} --prefix=${prefix} 
--libdir=${prefix}/lib/pseudo/lib --with-sqlite-lib=${baselib} 
--with-sqlite=${STAGING_DIR_TARGET}${exec_prefix} --cflags="${CFLAGS}" 
--bits=${SITEINFO_BITS} --enable-static-sqlite --without-rpath
./pseudo.inc:		./configure ${PSEUDO_EXTRA_OPTS} --prefix=${prefix} 
--libdir=${prefix}/lib/pseudo/lib --with-sqlite-lib=${baselib} 
--with-sqlite=${STAGING_DIR_TARGET}${exec_prefix} --bits=32 --without-rpath
./pseudo.inc:		./configure ${PSEUDO_EXTRA_OPTS} --prefix=${prefix} 
--libdir=${prefix}/lib/pseudo/lib --with-sqlite-lib=${baselib} 
--with-sqlite=${STAGING_DIR_TARGET}${exec_prefix} --bits=32 --without-rpath
./pseudo.inc:	oe_runmake 'DESTDIR=${D}' ${MAKEOPTS} 
'LIB=lib/pseudo/lib$(MARK64)' install
./pseudo.inc:		mkdir -p ${D}${prefix}/lib/pseudo/lib
./pseudo.inc:		cp lib/pseudo/lib/libpseudo.so ${D}${prefix}/lib/pseudo/lib/.
./pseudo.inc:		mkdir -p ${D}${prefix}/lib/pseudo/lib
./pseudo.inc:		cp lib/pseudo/lib/libpseudo.so ${D}${prefix}/lib/pseudo/lib/.
lirq@lirq-OptiPlex-780:/home/prj/oe-core/meta/recipes-devtools/pseudo$


-Roy

>
> Richard
>
>
>

-- 
Best Reagrds,
Roy | RongQing Li

