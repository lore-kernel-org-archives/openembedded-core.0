Received: from mail1.windriver.com ([147.11.146.13])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <Liezhi.Yang@windriver.com>) id 1SIaPi-0008Fw-D3
	for openembedded-core@lists.openembedded.org;
	Fri, 13 Apr 2012 08:55:22 +0200
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca [147.11.189.40])
	by mail1.windriver.com (8.14.3/8.14.3) with ESMTP id q3D6k0ov012377
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Thu, 12 Apr 2012 23:46:00 -0700 (PDT)
Received: from [128.224.162.196] (128.224.162.196) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server id 14.1.255.0;
	Thu, 12 Apr 2012 23:46:00 -0700
Message-ID: <4F87CBA6.7040207@windriver.com>
Date: Fri, 13 Apr 2012 14:45:58 +0800
From: Robert Yang <liezhi.yang@windriver.com>
User-Agent: Mozilla/5.0 (X11; Linux i686;
	rv:11.0) Gecko/20120310 Thunderbird/11.0
MIME-Version: 1.0
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: gcc-cross: Argument list too long
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
X-List-Received-Date: Fri, 13 Apr 2012 06:55:22 -0000
Content-Type: text/plain; charset="ISO-8859-1"; format=flowed
Content-Transfer-Encoding: 7bit


There would be an error when building gcc-cross in the do_install stage
if the TMPDIR's length is more than 200 characters:

make[1]: execvp: /bin/sh: Argument list too long

This is because of the limit of /usr/include/linux/limits.h:

$ grep PATH_MAX /usr/include/linux/limits.h
#define PATH_MAX        4096    /* # chars in a path name including nul */

I don't think it's worth to fix the do_install of gcc-cross, but it would
be good if we can add a check in oe-init-build-env or meta/classes
/sanity.bbclass to check wether the TMPDIR(or build directory) is longer than a 
reasonable vaule, e.g., 1/16th or 1/32th of PATH_MAX? If you are OK with this,
I'd like to work on it.

To reproduce the error:

$ cd /path/to/workdir/
$ for i in `seq 20`; do mkdir _23_5_78_; cd _23_5_78_; done
$ source /path/to/poky/oe-init-build-env
$ bitbake gcc-cross

Then the error comes.

$ pwd | wc -c
224

-- 
Thanks

Robert


