Return-Path: <Kai.Kang@windriver.com>
Received: from mail.windriver.com (mail.windriver.com [147.11.1.11])
	by mail.openembedded.org (Postfix) with ESMTP id 2FCCC65F18
	for <openembedded-core@lists.openembedded.org>;
	Tue, 24 Jun 2014 01:49:45 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail.windriver.com (8.14.5/8.14.5) with ESMTP id s5O1ndKJ022383
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL);
	Mon, 23 Jun 2014 18:49:39 -0700 (PDT)
Received: from [128.224.162.231] (128.224.162.231) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server (TLS) id 14.3.169.1;
	Mon, 23 Jun 2014 18:49:38 -0700
Message-ID: <53A8D92F.3010304@windriver.com>
Date: Tue, 24 Jun 2014 09:49:35 +0800
From: Kang Kai <Kai.Kang@windriver.com>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:24.0) Gecko/20100101 Thunderbird/24.4.0
MIME-Version: 1.0
To: "openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>, <anders@chargestorm.se>
References: <cover.1403490121.git.kai.kang@windriver.com>
	<89ff3aaad229d018851347dcda7d8c0e7cea6429.1403490121.git.kai.kang@windriver.com>
	<20140623114436.GA16414@ad.chargestorm.se>
In-Reply-To: <20140623114436.GA16414@ad.chargestorm.se>
X-Originating-IP: [128.224.162.231]
Subject: Re: [PATCH 5/5] iptables: update init script and bb file
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
X-List-Received-Date: Tue, 24 Jun 2014 01:49:47 -0000
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit

On 2014年06月23日 19:44, Anders Darander wrote:
> * Kai Kang <kai.kang@windriver.com> [140623 04:34]:
>> Update path of command iptables in init script that we put it in
>> /usr/sbin rather than /sbin. Then update bb file to install init script,
>> configure and rules files.
> These new files aren't that big, but could you anyway package at least
> the rules files into a separate package? Using an RRECOMMENDS would be
> fine, as I can easily add a BAD_RECOMMENDATION for that package.

Of course.

And as I replied in last main, do you think that an empty rule is 
better? A little concern is for iptables newbies.

>
> It might be that I don't need/want both of iptables and ip6tables
> installed; or even that I don't want either of those installed by
> default.

iptables and ip6tables are not split into separated packages, so I put 
them together. And package iptbales is not installed by default indeed.

Regards,
Kai

>
> Cheers,
> Anders
>
>> +do_install_append() {
>> +	install -d -m 755 ${D}${sysconfdir}/init.d
>> +	install -m 755 ${WORKDIR}/iptables.init ${D}${sysconfdir}/init.d/iptables
>> +	install -m 755 ${WORKDIR}/iptables.init ${D}${sysconfdir}/init.d/ip6tables
>> +	sed -i -e 's;iptables;ip6tables;g' -e 's;IPTABLES;IP6TABLES;g' ${D}${sysconfdir}/init.d/ip6tables
>> +
>> +	install -d -m 755 ${D}${sysconfdir}/sysconfig
>> +	install -m 755 ${WORKDIR}/iptables-config ${D}${sysconfdir}/sysconfig
>> +	install -m 755 ${WORKDIR}/iptables-config ${D}${sysconfdir}/sysconfig/ip6tables-config
>> +	sed -i -e 's;iptables;ip6tables;g' -e 's;IPTABLES;IP6TABLES;g' ${D}${sysconfdir}/sysconfig/ip6tables-config
>> +
>> +	install -m 755 ${WORKDIR}/iptables.rules ${D}${sysconfdir}/sysconfig/iptables
>> +	install -m 755 ${WORKDIR}/ip6tables.rules ${D}${sysconfdir}/sysconfig/ip6tables
>> +}


-- 
Regards,
Neil | Kai Kang


