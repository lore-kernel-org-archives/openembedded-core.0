Received: from mga09.intel.com ([134.134.136.24])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <paul.eggleton@linux.intel.com>) id 1TEd1c-0005gA-4E
	for openembedded-core@lists.openembedded.org;
	Thu, 20 Sep 2012 11:26:24 +0200
Received: from orsmga001.jf.intel.com ([10.7.209.18])
	by orsmga102.jf.intel.com with ESMTP; 20 Sep 2012 02:13:25 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.80,453,1344236400"; d="scan'208";a="195223993"
Received: from unknown (HELO helios.localnet) ([10.252.121.248])
	by orsmga001.jf.intel.com with ESMTP; 20 Sep 2012 02:13:25 -0700
From: Paul Eggleton <paul.eggleton@linux.intel.com>
To: Andrei Gherzan <andrei@gherzan.ro>
Date: Thu, 20 Sep 2012 10:13:24 +0100
Message-ID: <1901405.KksRQfqGgP@helios>
Organization: Intel Corporation
User-Agent: KMail/4.9 (Linux/3.2.0-30-generic-pae; KDE/4.9.0; i686; ; )
In-Reply-To: <1348130679-31552-1-git-send-email-andrei@gherzan.ro>
References: <1348130679-31552-1-git-send-email-andrei@gherzan.ro>
MIME-Version: 1.0
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH] Replace "echo -e" with "printf" to have the same behavior in dash or bash
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-core>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Thu, 20 Sep 2012 09:26:24 -0000
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="us-ascii"

On Thursday 20 September 2012 11:44:39 Andrei Gherzan wrote:
> oe-core removed the prerequisite to have sh as bash. POSIX doesn't define
> any options and furthermore allows echo -e to be the default behavior.
> This means that in dash "echo -e" will actually print "-e" and interpret
> backslashes by default. We use instead "printf" builtin command with or
> without "\n" to simulate echo -e or echo -n.

I haven't looked over the whole patch, but I did notice a couple of issues - 
printf does not behave exactly like echo in a couple of situations: 

 (a) if you supply no arguments printf will return an error whereas echo does 
not, this will probably break situations where you have changed the script to 
do 'printf > /some/file'. Since these statements are usually intended to create 
or truncate the specified file, I wonder if we should just change these to do '> 
/some/file' instead which works for dash and bash (and doesn't otherwise appear 
to be a bashism).

 (b) 'printf "\n"' will print just one newline, whereas echo -e "\n" prints 
two. Not sure if this is significant but I think we would rather keep the 
behaviour the same.

Cheers,
Paul

-- 

Paul Eggleton
Intel Open Source Technology Centre


