Return-Path: <Qi.Chen@windriver.com>
Received: from mail.windriver.com (mail.windriver.com [147.11.1.11])
	by mail.openembedded.org (Postfix) with ESMTP id 0B41960557
	for <openembedded-core@lists.openembedded.org>;
	Wed,  4 Feb 2015 08:04:01 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail.windriver.com (8.14.9/8.14.5) with ESMTP id t1483ugP011381
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL);
	Wed, 4 Feb 2015 00:03:57 -0800 (PST)
Received: from [128.224.162.226] (128.224.162.226) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server (TLS) id 14.3.174.1;
	Wed, 4 Feb 2015 00:03:56 -0800
Message-ID: <54D1D26A.50909@windriver.com>
Date: Wed, 4 Feb 2015 16:03:54 +0800
From: ChenQi <Qi.Chen@windriver.com>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:31.0) Gecko/20100101 Thunderbird/31.4.0
MIME-Version: 1.0
To: Peter Gejgus <Peter.Gejgus@kistler.com>,
	"openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
References: <672D6A2F0F2E8A43891580C45CE5D2E6013D7790@kihagwinex02.int.kistler.com>
In-Reply-To: <672D6A2F0F2E8A43891580C45CE5D2E6013D7790@kihagwinex02.int.kistler.com>
X-Originating-IP: [128.224.162.226]
Subject: Re: post-installation scripts vs. init scripts
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
X-List-Received-Date: Wed, 04 Feb 2015 08:04:03 -0000
Content-Type: text/plain; charset="windows-1252"; format=flowed
Content-Transfer-Encoding: 7bit

In OE, sysvinit scripts are executed one by one at start-up.
The post-install scripts are run at first boot via 
/etc/rcS/S99run-postinsts.

E.g.
We have:
1) /etc/rc3/S10bind
2) /etc/rcS/S03udev
3) /etc/rcS/S99run-postinsts

The execution sequence is 2) -> 3) -> 1).

Regards,
Chen Qi

On 02/04/2015 03:33 PM, Peter Gejgus wrote:
> Hello,
>
> I've checked experimentally that post-installation scripts (executed during the first boot) run before init scripts. I've checked it by putting long sleep into the following script and I've also verified timestamps from init script and post-install script in the log:
>
> pkg_postinst_PACKAGENAME()
> {
>       #!/bin/sh -e
>       if [ x"$D" = "x" ]; then
>            # Actions to carry out on the device go here
>            sleep 300
>       else
>            exit 1
>       fi
>   }
>
> Can you confirm that post-install scripts run before init scripts and there is no overlap?
>
> Regards,
> Peter


