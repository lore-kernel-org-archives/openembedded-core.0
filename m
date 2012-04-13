Received: from 93-97-173-237.zone5.bethere.co.uk ([93.97.173.237]
	helo=tim.rpsys.net) by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <richard.purdie@linuxfoundation.org>)
	id 1SIc3m-0003QS-1p for openembedded-core@lists.openembedded.org;
	Fri, 13 Apr 2012 10:40:50 +0200
Received: from localhost (localhost [127.0.0.1])
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id q3D8VTXC032174
	for <openembedded-core@lists.openembedded.org>;
	Fri, 13 Apr 2012 09:31:29 +0100
Received: from tim.rpsys.net ([127.0.0.1])
	by localhost (tim.rpsys.net [127.0.0.1]) (amavisd-new,
	port 10024) with LMTP
	id 31463-03 for <openembedded-core@lists.openembedded.org>;
	Fri, 13 Apr 2012 09:31:25 +0100 (BST)
Received: from [192.168.3.10] ([192.168.3.10]) (authenticated bits=0)
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id q3D8VIGO032167
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-SHA bits=256 verify=NO)
	for <openembedded-core@lists.openembedded.org>;
	Fri, 13 Apr 2012 09:31:20 +0100
Message-ID: <1334305879.7309.46.camel@ted>
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Date: Fri, 13 Apr 2012 09:31:19 +0100
In-Reply-To: <4F87CBA6.7040207@windriver.com>
References: <4F87CBA6.7040207@windriver.com>
X-Mailer: Evolution 3.2.2- 
Mime-Version: 1.0
X-Virus-Scanned: amavisd-new at rpsys.net
Subject: Re: gcc-cross: Argument list too long
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
X-List-Received-Date: Fri, 13 Apr 2012 08:40:50 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Fri, 2012-04-13 at 14:45 +0800, Robert Yang wrote:
> There would be an error when building gcc-cross in the do_install stage
> if the TMPDIR's length is more than 200 characters:
> 
> make[1]: execvp: /bin/sh: Argument list too long
> 
> This is because of the limit of /usr/include/linux/limits.h:
> 
> $ grep PATH_MAX /usr/include/linux/limits.h
> #define PATH_MAX        4096    /* # chars in a path name including nul */
> 
> I don't think it's worth to fix the do_install of gcc-cross, but it would
> be good if we can add a check in oe-init-build-env or meta/classes
> /sanity.bbclass to check wether the TMPDIR(or build directory) is longer than a 
> reasonable vaule, e.g., 1/16th or 1/32th of PATH_MAX? If you are OK with this,
> I'd like to work on it.
> 
> To reproduce the error:
> 
> $ cd /path/to/workdir/
> $ for i in `seq 20`; do mkdir _23_5_78_; cd _23_5_78_; done
> $ source /path/to/poky/oe-init-build-env
> $ bitbake gcc-cross
> 
> Then the error comes.
> 
> $ pwd | wc -c
> 224

I think sanity.bbclass would be a good place to have a one time check of
the length of TMPDIR...

Cheers,

Richard



