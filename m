Return-Path: <sgw@linux.intel.com>
Received: from mga03.intel.com (mga03.intel.com [134.134.136.65])
	by mail.openembedded.org (Postfix) with ESMTP id B284C60169
	for <openembedded-core@lists.openembedded.org>;
	Wed,  3 Dec 2014 00:13:28 +0000 (UTC)
Received: from orsmga001.jf.intel.com ([10.7.209.18])
	by orsmga103.jf.intel.com with ESMTP; 02 Dec 2014 16:09:47 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.07,504,1413270000"; d="scan'208";a="617619317"
Received: from smoffitt-mobl.ger.corp.intel.com (HELO [10.255.13.114])
	([10.255.13.114])
	by orsmga001.jf.intel.com with ESMTP; 02 Dec 2014 16:13:09 -0800
Message-ID: <547E5595.20807@linux.intel.com>
Date: Tue, 02 Dec 2014 16:13:09 -0800
From: Saul Wold <sgw@linux.intel.com>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:24.0) Gecko/20100101 Thunderbird/24.7.0
MIME-Version: 1.0
To: Diego <diego.ml@zoho.com>, openembedded-core@lists.openembedded.org
References: <2727351.QZhbar3BFX@localhost.localdomain>
In-Reply-To: <2727351.QZhbar3BFX@localhost.localdomain>
Subject: Re: [BUG] Openssh not closing connections on service stop
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
X-List-Received-Date: Wed, 03 Dec 2014 00:13:37 -0000
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit

On 11/27/2014 09:06 AM, Diego wrote:
> Hi all,
>
> I'd like to share with you what I consider a bug.
>
> I've generally noticed in my Linux experience that I get automatically
> disconnected from an ssh session if the ssh host gets shutdown or rebooted
> with the message:
> Connection to x.y.w.z closed by remote host.
> Connection to x.y.w.z closed.
>
Well this is because the machine is actually shut down or halted, 
therefore all processes get killed regardless, this is not necessarily a 
function of stopping the daemon

> This doesn't seem to happen on my OSes built on core-image-minimal with
> openssh support.
>
> Moreover I noticed that if I stop the ssh service:
> # /etc/init.d/sshd stop
> my ssh connections don't get dropped, I can continue using ssh session like
> nothing happened. I can even see the connection process still up and running:
> # ps | grep ssh
>   1790 root      4568 S    /usr/sbin/sshd
>   1848 root      4852 S    sshd: root@pts/0
>   1886 root      2896 S    grep ssh
> # /etc/init.d/sshd stop
> Stopping OpenBSD Secure Shell server: sshdstopped /usr/sbin/sshd (pid 1790)
> .
> # ps | grep ssh
>   1848 root      4852 S    sshd: root@pts/0
>   1894 root      2892 S    grep ssh
>
> Isn't service termination supposed to stop all related connections at the same
> time? Can anybody else reproduce (or not) this issue?
>
It may actually be designed to work this way, since the daemon spawns a 
process for each login the daemon can be restarted on a headless or 
server type machine and not loose the connection, based on googling, I 
could not find this outright on the Openssh.com site.

It appears that the dropbear sshd also has the behavior.

So I would not call this a bug.

Sau!

> Bests,
> Diego
>

