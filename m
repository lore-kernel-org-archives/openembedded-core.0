Received: from mga02.intel.com ([134.134.136.20])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <ke.yu@intel.com>) id 1QezMw-00046J-Qd
	for openembedded-core@lists.openembedded.org;
	Fri, 08 Jul 2011 02:56:35 +0200
Received: from orsmga001.jf.intel.com ([10.7.209.18])
	by orsmga101.jf.intel.com with ESMTP; 07 Jul 2011 17:52:42 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.65,496,1304319600"; d="scan'208";a="24702714"
Received: from kyu3-desk.ccr.corp.intel.com (HELO [10.238.154.176])
	([10.238.154.176])
	by orsmga001.jf.intel.com with ESMTP; 07 Jul 2011 17:52:41 -0700
Message-ID: <4E1654D8.2040406@intel.com>
Date: Fri, 08 Jul 2011 08:52:40 +0800
From: Yu Ke <ke.yu@intel.com>
User-Agent: Mozilla/5.0 (Windows; U; Windows NT 5.1; en-US;
	rv:1.9.2.18) Gecko/20110616 Thunderbird/3.1.11
MIME-Version: 1.0
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
References: <cover.1310047266.git.ke.yu@intel.com>	<46e97fb7d91eecd7e874e65a59b88a1e51ca131f.1310047266.git.ke.yu@intel.com>
	<1310066545.20015.844.camel@rex>
In-Reply-To: <1310066545.20015.844.camel@rex>
Subject: Re: [PATCH 4/8] python: fix for libdir=/usr/lib64 case
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
X-List-Received-Date: Fri, 08 Jul 2011 00:56:35 -0000
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit

on 2011-7-8 3:22, Richard Purdie wrote:
> On Thu, 2011-07-07 at 22:10 +0800, Yu Ke wrote:
>> python has several place hard code "lib" which breaks build
>> when libdir=/usr/lib64. SUSE has a patch to fix this issue.
>>
>> So this patch add the SUSE patch to address this issue
>>
>> Signed-off-by: Yu Ke<ke.yu@intel.com>
> [...]
>> ++AC_SUBST(LIB)
>> ++AC_MSG_CHECKING(LIB)
>> ++case $ac_sys_system in
>> ++Linux*)
>> ++  # Test if the compiler is 64bit
>> ++  echo 'int i;'>  conftest.$ac_ext
>> ++  python_cv_cc_64bit_output=no
>> ++  if AC_TRY_EVAL(ac_compile); then
>> ++    case `/usr/bin/file conftest.$ac_objext` in
>> ++    *"ELF 64"*)
>> ++      python_cv_cc_64bit_output=yes
>> ++      ;;
>> ++    esac
>> ++  fi
>> ++  rm -rf conftest*
>> ++  ;;
>> ++esac
>> ++
>> ++case $ARCH:$python_cv_cc_64bit_output in
>> ++ppc64:yes | powerpc64:yes | s390x:yes | sparc64:yes | x86_64:yes)
>> ++  LIB="lib64"
>> ++  ;;
>> ++*:*)
>> ++  LIB="lib"
>> ++  ;;
>> ++esac
>> ++AC_MSG_RESULT($LIB)
>> +
>
> This patch is good apart from this bit. I think we need to be able to
> pass in our own string to use here which we derive from the libdir
> variable...
>

Yes, indeed. I will revise it to use libdir instead of hardcode lib/lib64.

Regards
Ke


