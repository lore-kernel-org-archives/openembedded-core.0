Received: from 93-97-173-237.zone5.bethere.co.uk ([93.97.173.237]
	helo=tim.rpsys.net) by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <richard.purdie@linuxfoundation.org>)
	id 1Qey4u-0002Ru-C1 for openembedded-core@lists.openembedded.org;
	Fri, 08 Jul 2011 01:33:52 +0200
Received: from localhost (localhost [127.0.0.1])
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id p67NU0PK011947;
	Fri, 8 Jul 2011 00:30:00 +0100
Received: from tim.rpsys.net ([127.0.0.1])
	by localhost (tim.rpsys.net [127.0.0.1]) (amavisd-new,
	port 10024) with LMTP
	id 11856-01-4; Fri,  8 Jul 2011 00:29:48 +0100 (BST)
Received: from [192.168.3.10] ([192.168.3.10]) (authenticated bits=0)
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id p67JN2Ij025226
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-SHA bits=256 verify=NO);
	Thu, 7 Jul 2011 20:23:02 +0100
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Yu Ke <ke.yu@intel.com>
In-Reply-To: <46e97fb7d91eecd7e874e65a59b88a1e51ca131f.1310047266.git.ke.yu@intel.com>
References: <cover.1310047266.git.ke.yu@intel.com>
	<46e97fb7d91eecd7e874e65a59b88a1e51ca131f.1310047266.git.ke.yu@intel.com>
Date: Thu, 07 Jul 2011 20:22:25 +0100
Message-ID: <1310066545.20015.844.camel@rex>
Mime-Version: 1.0
X-Mailer: Evolution 2.32.2 
X-Virus-Scanned: amavisd-new at rpsys.net
Cc: openembedded-core@lists.openembedded.org
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
X-List-Received-Date: Thu, 07 Jul 2011 23:33:52 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Thu, 2011-07-07 at 22:10 +0800, Yu Ke wrote:
> python has several place hard code "lib" which breaks build
> when libdir=/usr/lib64. SUSE has a patch to fix this issue.
> 
> So this patch add the SUSE patch to address this issue
> 
> Signed-off-by: Yu Ke <ke.yu@intel.com>
[...]
> ++AC_SUBST(LIB)
> ++AC_MSG_CHECKING(LIB)
> ++case $ac_sys_system in
> ++Linux*)
> ++  # Test if the compiler is 64bit
> ++  echo 'int i;' > conftest.$ac_ext
> ++  python_cv_cc_64bit_output=no
> ++  if AC_TRY_EVAL(ac_compile); then
> ++    case `/usr/bin/file conftest.$ac_objext` in
> ++    *"ELF 64"*)
> ++      python_cv_cc_64bit_output=yes
> ++      ;;
> ++    esac
> ++  fi
> ++  rm -rf conftest*
> ++  ;;
> ++esac
> ++
> ++case $ARCH:$python_cv_cc_64bit_output in
> ++ppc64:yes | powerpc64:yes | s390x:yes | sparc64:yes | x86_64:yes)
> ++  LIB="lib64"
> ++  ;;
> ++*:*)
> ++  LIB="lib"
> ++  ;;
> ++esac
> ++AC_MSG_RESULT($LIB)
> + 

This patch is good apart from this bit. I think we need to be able to
pass in our own string to use here which we derive from the libdir
variable...

Cheers,

Richard



