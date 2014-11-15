Return-Path: <mark.hatle@windriver.com>
Received: from mail1.windriver.com (mail1.windriver.com [147.11.146.13])
	by mail.openembedded.org (Postfix) with ESMTP id 2A3017190D
	for <openembedded-core@lists.openembedded.org>;
	Sat, 15 Nov 2014 21:19:27 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail1.windriver.com (8.14.9/8.14.5) with ESMTP id sAFLJQoQ008634
	(version=TLSv1/SSLv3 cipher=AES256-SHA bits=256 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Sat, 15 Nov 2014 13:19:27 -0800 (PST)
Received: from Marks-MacBook-Pro.local (172.25.36.232) by
	ALA-HCA.corp.ad.wrs.com (147.11.189.50) with Microsoft SMTP Server id
	14.3.174.1; Sat, 15 Nov 2014 13:19:26 -0800
Message-ID: <5467C364.7080008@windriver.com>
Date: Sat, 15 Nov 2014 15:19:32 -0600
From: Mark Hatle <mark.hatle@windriver.com>
Organization: Wind River Systems
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.10;
	rv:24.0) Gecko/20100101 Thunderbird/24.6.0
MIME-Version: 1.0
To: <openembedded-core@lists.openembedded.org>
References: <5466E6B7.2050609@pabigot.com>
In-Reply-To: <5466E6B7.2050609@pabigot.com>
Subject: Re: why does useradd.bbclass loop retrying its commands?
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
X-List-Received-Date: Sat, 15 Nov 2014 21:19:35 -0000
Content-Type: text/plain; charset="ISO-8859-1"; format=flowed
Content-Transfer-Encoding: 7bit

On 11/14/14, 11:37 PM, Peter A. Bigot wrote:
> The useradd, groupadd, and groupmems commands in useradd.bbclass are
> executed in a loop with up to 10 failed attempts before they give up.
> This appears to have always been the case, as long as that file has been
> present.

If multiple recipes/packages have the user, group, or shadow databases open -- 
the system will block until they are done maniuplating the file.

> Is there any reason why an initial failed attempt to execute one of
> these commands would be expected to succeed on retry, other than because
> delaying failure gives a chance for concurrently executing task to
> complete and so satisfy a dependency?

Depending on system, cores, etc.. we've seen easily it take up to 5-7 tries 
before the files unlock and are available for processing.

--Mark

> (This isn't the root cause of the pseudo autobuilder failure under
> multilib, but it did look plausible for a while.)
>
> Peter
>


