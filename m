Return-Path: <Nathan_Lynch@mentor.com>
Received: from relay1.mentorg.com (relay1.mentorg.com [192.94.38.131])
	by mail.openembedded.org (Postfix) with ESMTP id 611A3606E8
	for <openembedded-core@lists.openembedded.org>;
	Mon,  9 Feb 2015 17:39:43 +0000 (UTC)
Received: from svr-orw-fem-02x.mgc.mentorg.com ([147.34.96.206]
	helo=SVR-ORW-FEM-02.mgc.mentorg.com)
	by relay1.mentorg.com with esmtp 
	id 1YKsJE-0006rs-OP from Nathan_Lynch@mentor.com 
	for openembedded-core@lists.openembedded.org;
	Mon, 09 Feb 2015 09:39:44 -0800
Received: from [127.0.0.1] (147.34.91.1) by SVR-ORW-FEM-02.mgc.mentorg.com
	(147.34.96.168) with Microsoft SMTP Server id 14.3.224.2;
	Mon, 9 Feb 2015 09:39:44 -0800
Message-ID: <54D8F0DF.9050703@mentor.com>
Date: Mon, 9 Feb 2015 11:39:43 -0600
From: Nathan Lynch <Nathan_Lynch@mentor.com>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:31.0) Gecko/20100101 Thunderbird/31.4.0
MIME-Version: 1.0
To: <openembedded-core@lists.openembedded.org>
References: <1423263383-15461-1-git-send-email-nathan_lynch@mentor.com>
In-Reply-To: <1423263383-15461-1-git-send-email-nathan_lynch@mentor.com>
Subject: Re: [PATCH] lttng-tools: use perl-misc, perl-modules in ptest deps
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
X-List-Received-Date: Mon, 09 Feb 2015 17:39:46 -0000
Content-Type: text/plain; charset="windows-1252"
Content-Transfer-Encoding: 7bit

On 02/06/2015 04:56 PM, Nathan Lynch wrote:
> The testcases for lttng-tools use the "prove" command from perl-misc,
> which needs many modules not in the base perl package.

BTW, several of the lttng-tools testcases emit:

  libgcc_s.so.1 must be installed for pthread_cancel to work

This is a fatal error from glibc.  glibc's README says:

  Also note that the shared version of the libgcc_s library must be
  installed for the pthread library to work correctly.

There is no libgcc_s.so.1 on the target.  In glibc.inc I see:

# nptl needs libgcc but dlopens it, so our shlibs code doesn't detect this
#RDEPENDS_${PN} += "${@['','libgcc']['nptl' in '${GLIBC_ADDONS}']}"

but I haven't been able to find out why this code is disabled.
Uncommenting it fixes the issue for me.  Is that the right fix?


