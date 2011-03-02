Received: from mail.windriver.com ([147.11.1.11])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <mark.hatle@windriver.com>) id 1PubBC-0005fF-U1
	for openembedded-core@lists.openembedded.org;
	Wed, 02 Mar 2011 02:48:43 +0100
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca [147.11.189.40])
	by mail.windriver.com (8.14.3/8.14.3) with ESMTP id p221lFct022285
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Tue, 1 Mar 2011 17:47:15 -0800 (PST)
Received: from Macintosh-5.local (172.25.36.227) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server (TLS) id 14.1.255.0;
	Tue, 1 Mar 2011 17:47:14 -0800
Message-ID: <4D6DA1A1.3030409@windriver.com>
Date: Tue, 1 Mar 2011 19:47:13 -0600
From: Mark Hatle <mark.hatle@windriver.com>
Organization: Wind River Systems
User-Agent: Mozilla/5.0 (Macintosh; U; Intel Mac OS X 10.6; en-US;
	rv:1.9.2.13) Gecko/20101207 Thunderbird/3.1.7
MIME-Version: 1.0
To: <openembedded-core@lists.openembedded.org>
References: <1299029911-3973-1-git-send-email-raj.khem@gmail.com>
	<1299029911-3973-7-git-send-email-raj.khem@gmail.com>
In-Reply-To: <1299029911-3973-7-git-send-email-raj.khem@gmail.com>
X-Originating-IP: [172.25.36.227]
Subject: Re: [PATCH 6/6] sanity.bbclass: Check for mmap_min_addr can	be safely removed
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
X-List-Received-Date: Wed, 02 Mar 2011 01:48:43 -0000
Content-Type: text/plain; charset="ISO-8859-1"
Content-Transfer-Encoding: 7bit

If we set the value to 65536 in the other patch, I'd prefer this check remain
and check for 65536 instead.  (Or change the check to show that it has a high
probability of working.)

--Mark

On 3/1/11 7:38 PM, Khem Raj wrote:
> * QEMU is already patch to take care of it
> 
> Signed-off-by: Khem Raj <raj.khem@gmail.com>
> ---
>  meta/classes/sanity.bbclass |   11 -----------
>  1 files changed, 0 insertions(+), 11 deletions(-)
> 
> diff --git a/meta/classes/sanity.bbclass b/meta/classes/sanity.bbclass
> index 13940f8..2af6f4b 100644
> --- a/meta/classes/sanity.bbclass
> +++ b/meta/classes/sanity.bbclass
> @@ -166,17 +166,6 @@ def check_sanity(e):
>      if "." in data.getVar('PATH', e.data, True).split(":"):
>          messages = messages + "PATH contains '.' which will break the build, please remove this"
>  
> -    if data.getVar('TARGET_ARCH', e.data, True) == "arm":
> -        # This path is no longer user-readable in modern (very recent) Linux
> -        try:
> -            if os.path.exists("/proc/sys/vm/mmap_min_addr"):
> -                f = file("/proc/sys/vm/mmap_min_addr", "r")
> -                if (f.read().strip() != "0"):
> -                        messages = messages + "/proc/sys/vm/mmap_min_addr is not 0. This will cause problems with qemu so please fix the value (as root).\n\nTo fix this in later reboots, set vm.mmap_min_addr = 0 in /etc/sysctl.conf.\n"
> -                f.close()
> -        except:
> -            pass
> -
>      for util in required_utilities.split():
>          if not check_app_exists( util, e.data ):
>              missing = missing + "%s," % util



