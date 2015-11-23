Return-Path: <mark.hatle@windriver.com>
Received: from mail1.windriver.com (mail1.windriver.com [147.11.146.13])
	by mail.openembedded.org (Postfix) with ESMTP id 3901D6010D
	for <openembedded-core@lists.openembedded.org>;
	Mon, 23 Nov 2015 14:17:02 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail1.windriver.com (8.15.2/8.15.1) with ESMTPS id tANEH3l0003605
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Mon, 23 Nov 2015 06:17:03 -0800 (PST)
Received: from Marks-MacBook-Pro.local (172.25.36.232) by
	ALA-HCA.corp.ad.wrs.com (147.11.189.50) with Microsoft SMTP Server id
	14.3.248.2; Mon, 23 Nov 2015 06:16:02 -0800
To: <openembedded-core@lists.openembedded.org>
References: <alpine.LFD.2.20.1511220407380.13727@localhost>
From: Mark Hatle <mark.hatle@windriver.com>
Organization: Wind River Systems
Message-ID: <56531FA2.8020209@windriver.com>
Date: Mon, 23 Nov 2015 08:16:02 -0600
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.11; rv:38.0)
	Gecko/20100101 Thunderbird/38.3.0
MIME-Version: 1.0
In-Reply-To: <alpine.LFD.2.20.1511220407380.13727@localhost>
Subject: Re: what is the value of 'BBPATH ?= ""' in layer.conf?
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
X-List-Received-Date: Mon, 23 Nov 2015 14:17:07 -0000
Content-Type: text/plain; charset="windows-1252"
Content-Transfer-Encoding: 7bit

On 11/22/15 3:10 AM, Robert P. J. Day wrote:
> 
>   perusing some wind river layers, and in the layer.conf file here:
> 
> https://github.com/WindRiver-OpenSourceLabs/wr-kernel/blob/LB21_7.0_RCPL0002/conf/layer.conf
> 
> i see the opening snippet:
> 
>   BBPATH ?= ""
>   # We have a conf and classes directory, add to BBPATH
>   BBPATH := "${LAYERDIR}:${BBPATH}"

(for the -first- layer defined)

BBPATH := "${LAYERDIR}:${BBPATH}"

will result in a warning or error because the ${BBPATH} can't be expanded.

There was a commit late 2013 to OE-Core and most related layers that turned this
into a append (or in this case prepend):

BBPATH =. "${LAYERDIR}:"

This is stop the need for the BBPATH and work properly.

LAYERDIR is always expanded when used, so no need for the :=

--Mark

> what is the purpose of that initial assignment
> 
>   BBPATH ?= ""
> 
> if that variable has no value, won't it just expand to the empty
> string so that the eventual effect is the same? or is there something
> more subtle happening here?
> 
> rday
> 


