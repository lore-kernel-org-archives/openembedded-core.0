Return-Path: <Qi.Chen@windriver.com>
Received: from mail.windriver.com (mail.windriver.com [147.11.1.11])
	by mail.openembedded.org (Postfix) with ESMTP id 283AB610F6
	for <openembedded-core@lists.openembedded.org>;
	Fri, 24 Jan 2014 01:38:06 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail.windriver.com (8.14.5/8.14.5) with ESMTP id s0O1c6Lw004243
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Thu, 23 Jan 2014 17:38:06 -0800 (PST)
Received: from [128.224.162.164] (128.224.162.164) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server (TLS) id 14.2.347.0;
	Thu, 23 Jan 2014 17:38:05 -0800
Message-ID: <52E1C40A.1020601@windriver.com>
Date: Fri, 24 Jan 2014 09:38:18 +0800
From: ChenQi <Qi.Chen@windriver.com>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:24.0) Gecko/20100101 Thunderbird/24.2.0
MIME-Version: 1.0
To: <openembedded-core@lists.openembedded.org>
References: <CADV-EXE1HK6Qrg9ksCxdrEzvGEnBiAPFtoy4B967Jr1axtofTQ@mail.gmail.com>
In-Reply-To: <CADV-EXE1HK6Qrg9ksCxdrEzvGEnBiAPFtoy4B967Jr1axtofTQ@mail.gmail.com>
X-Originating-IP: [128.224.162.164]
Subject: Re: update-alternatives: symlinks are not created
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
X-List-Received-Date: Fri, 24 Jan 2014 01:38:07 -0000
Content-Type: text/plain; charset="ISO-8859-1"; format=flowed
Content-Transfer-Encoding: 7bit

On 01/24/2014 08:48 AM, Yevhen Kyriukha wrote:
> I've built custom image with busybox included and noticed that
> symlinks for mkdir, ls, rm and other programs are not created.
>
> In do_rootfs log I have the following error messages:
> ...
> update-alternatives: error: alternative path /bin/busybox.suid doesn't exist
> ...
> update-alternatives: error: alternative path /bin/busybox.nosuid doesn't exist
> ...
>

I encountered the same problem.
The above error is because we're using update-alternatives from host.
It seems to be caused by recent changes about 
opkg/opkg-utils/update-alternatives.

I used the following steps to work around it.
bitbake opkg-utils-native -cpopulate_sysroot -f
bitbake <your-image> -crootfs -f

//Chen Qi

