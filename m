Return-Path: <richard.purdie@linuxfoundation.org>
Received: from dan.rpsys.net (dan.rpsys.net [93.97.175.187])
	by mail.openembedded.org (Postfix) with ESMTP id 704DE6E996
	for <openembedded-core@lists.openembedded.org>;
	Fri, 31 Jan 2014 15:48:55 +0000 (UTC)
Received: from localhost (dan.rpsys.net [127.0.0.1])
	by dan.rpsys.net (8.14.4/8.14.4/Debian-2.1ubuntu4) with ESMTP id
	s0VFmo4u015022; Fri, 31 Jan 2014 15:48:50 GMT
X-Virus-Scanned: Debian amavisd-new at dan.rpsys.net
Received: from dan.rpsys.net ([127.0.0.1])
	by localhost (dan.rpsys.net [127.0.0.1]) (amavisd-new, port 10024)
	with LMTP id anR6Nn9DMfTr; Fri, 31 Jan 2014 15:48:50 +0000 (GMT)
Received: from [192.168.3.10] (rpvlan0 [192.168.3.10]) (authenticated bits=0)
	by dan.rpsys.net (8.14.4/8.14.4/Debian-2.1ubuntu1) with ESMTP id
	s0VFmiPC015017
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-SHA bits=256 verify=NOT);
	Fri, 31 Jan 2014 15:48:45 GMT
Message-ID: <1391183318.24655.285.camel@ted>
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Mike Looijmans <mike.looijmans@topic.nl>
Date: Fri, 31 Jan 2014 15:48:38 +0000
In-Reply-To: <52EB5A0C.2050408@topic.nl>
References: <52EB5A0C.2050408@topic.nl>
X-Mailer: Evolution 3.8.4-0ubuntu1 
Mime-Version: 1.0
Cc: openembedded-core@lists.openembedded.org
Subject: Re: Make sstate cache local tool independent
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
X-List-Received-Date: Fri, 31 Jan 2014 15:48:55 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit

On Fri, 2014-01-31 at 09:08 +0100, Mike Looijmans wrote:
> ﻿I'm forced to using external tools in some recipes (that build FPGA bitstreams 
> using huge proprietary packages). Building these takes between half an hour 
> and several hours on big fast machines, so I definitely want to use 
> sstate-cache for these.
> 
> The trouble I'm running into is that I have a variable like XILINX_TOOL_PATH 
> which is in local.conf so people can tell where the tools are.
> 
> The compile part of the recipe runs something like 
> ${XILINX_TOOL_PATH}/bin/something
> 
> This makes the "compile" step dependent on that variable. When a machine 
> installs the tools somewhere else, it will have a different value for that 
> tool, and because OE thinks that matters, it will insist on building its very 
> own version of that package instead of just fetching it from the sstate-cache 
> on the buildserver.
> 
> How do I explain to OE that the value of this variable does not matter for the 
> sstate-cache?
> 
> I tried: do_compile[vardepsexclude] = "XILINX_TOOL_PATH"
> 
> that didn't appear to help.

Is the name of the compile step do_compile, or are there intermediate
functions?

vardepsexclude should work but you need to make sure you apply it to the
right variable/function.

Cheers,

Richard


