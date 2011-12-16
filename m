Received: from mga09.intel.com ([134.134.136.24])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <dvhart@linux.intel.com>) id 1RbcfW-00005u-IA
	for openembedded-core@lists.openembedded.org;
	Fri, 16 Dec 2011 19:38:06 +0100
Received: from orsmga001.jf.intel.com ([10.7.209.18])
	by orsmga102.jf.intel.com with ESMTP; 16 Dec 2011 10:31:06 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.67,352,1309762800"; d="scan'208";a="87375678"
Received: from unknown (HELO envy.home) ([10.255.12.232])
	by orsmga001.jf.intel.com with ESMTP; 16 Dec 2011 10:31:06 -0800
Message-ID: <4EEB8E58.3030806@linux.intel.com>
Date: Fri, 16 Dec 2011 10:30:48 -0800
From: Darren Hart <dvhart@linux.intel.com>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:7.0) Gecko/20110927 Thunderbird/7.0
MIME-Version: 1.0
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
X-Enigmail-Version: 1.3.3
Subject: Can we drop eglibc-utils from LIBC_DEPENDENCIES?
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
X-List-Received-Date: Fri, 16 Dec 2011 18:38:06 -0000
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit

I'm working on a minimal distro definition, and found that eglibc-utils
pulls in bash (needed for tzconfig and xtrace apparently) which pulls in
gettext, which requires wchar support. I'd like to remove eglibc-utils
from my distro definition. I could override the default I suspect, but I
wonder if eglibc-utils should be made an optional package that distro
definitions, images, or users should specifically add if needed?

The relevant bit of code appears to be:

meta/conf/distro/include/tclibc-eglibc.inc

LIBC_DEPENDENCIES = "libsegfault \
		     eglibc \
    		     eglibc-dbg \
    		     eglibc-dev \
    		     eglibc-utils \
    		     eglibc-thread-db \
    		     eglibc-localedata-i18n \
    		     eglibc-gconv-ibm850 \
    		     eglibc-gconv-cp1252 \
    		     eglibc-gconv-iso8859-1 \
    		     eglibc-gconv-iso8859-15 \
    		     locale-base-en-us \
    		     locale-base-en-gb "

eglibc-dbg and eglibc-dev also seem like they could be made optional.

Thoughts? Would anyone object to me removing at least eglibc-utils from
LIBC_DEPENDENCIES?

-- 
Darren Hart
Intel Open Source Technology Center
Yocto Project - Linux Kernel


