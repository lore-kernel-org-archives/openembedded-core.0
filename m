Received: from mail-yw0-f47.google.com ([209.85.213.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <andrei@gherzan.ro>) id 1SpO4G-00027W-0b
	for openembedded-core@lists.openembedded.org;
	Thu, 12 Jul 2012 20:24:54 +0200
Received: by yhjj56 with SMTP id j56so3014239yhj.6
	for <openembedded-core@lists.openembedded.org>;
	Thu, 12 Jul 2012 11:13:32 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=google.com; s=20120113;
	h=from:to:cc:subject:date:message-id:x-mailer:mime-version
	:content-type:content-transfer-encoding:x-gm-message-state;
	bh=5mZ7h3KiIaZqPGyiJFY8hfApvDgrF8dLrm8cpIA6qY0=;
	b=Zvzg/eYNGMN3BNeh9sypGNzXIt6UBX2hZ6HPVD4ItMeGqg1e/eX6SwZodECnkW5MDU
	X4DleTXEUGc6A1Nj6yLY+7TBuUFURCcU2+J1HGBVD+casN6itYvmcd+RS1pyzYtIlq1K
	kWNfdRDh2NhZFgRyMlITaOHj3auyGYrKpqRBS43mgjpl0NoxS79zLgzqoM/kGEXGLOsL
	32kb4tYdyqpDeQIIFQ0BwwcRCjHRflfJIGkvTDxQzf+4hd+8+0NGBwVuFPE+duLnXWKy
	9aT3op2qeAYzqd2ZK9hoRe/INwe4KbGAHkfmv29C3J+Gg3GK9iu4CvtciTF+1w462dMZ
	eEUQ==
Received: by 10.50.203.41 with SMTP id kn9mr18634164igc.72.1342116812152;
	Thu, 12 Jul 2012 11:13:32 -0700 (PDT)
Received: from otp-agherzan-l1.corp.ad.wrs.com ([89.121.200.106])
	by mx.google.com with ESMTPS id nh1sm33376igc.11.2012.07.12.11.13.30
	(version=TLSv1/SSLv3 cipher=OTHER);
	Thu, 12 Jul 2012 11:13:31 -0700 (PDT)
From: Andrei Gherzan <andrei@gherzan.ro>
To: openembedded-core@lists.openembedded.org
Date: Thu, 12 Jul 2012 21:13:22 +0300
Message-Id: <cover.1342116650.git.andrei@gherzan.ro>
X-Mailer: git-send-email 1.7.9.5
MIME-Version: 1.0
X-Gm-Message-State: ALoCoQkiUFQW8vXSIFG0VIa/if0DqEUZVEL4be9Qd7za/1azRZdM35tPxLIvmg5fiIbVpOl1LKPc
Cc: Koen Kooi <koen@dominion.thruhere.net>
Subject: [PATCH 0/3] Fix xz compression command and optimize compression time
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
X-List-Received-Date: Thu, 12 Jul 2012 18:24:54 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Koen suggested to add -T to xz commands. We have this option implemented in our current version .1alpha. 

-T threads, --threads=threads
              Specify the number of worker threads to use.  Setting threads to
              a special value 0 makes xz use as many threads as there are  CPU
              cores  on  the system.  The actual number of threads can be less
              than threads if the input file is not big enough  for  threading
              with  the  given  settings or if using more threads would exceed
              the memory usage limit.

-------------------

Memory: 7.8 GiB
Processor:: Intel® Core™ i5-2540M CPU @ 2.60GHz × 4

File to compress: 1.9G

xz -f -k -e -9 --check=crc32 (current configuration)
Memory: 673Mb
real    6m37.170s
user    6m35.389s
sys     0m0.884s
Compressed file size: 3.4Mb

xz -f -k -e -9 -T 4 --check=crc32
Memory: Cannot allocate memory

xz -f -k -e -8 -T 4 --check=crc32
Memory: 1.8G
real    3m24.462s
user    12m8.502s
sys     0m2.180s
Compressed file size: 3.4Mb

xz -f -k -T 4 --check=crc32 (-e defaults to -6)
Memory: 471Mb
real    1m9.265s
user    4m8.972s
sys     0m0.944s
Compressed file size: 3.4Mb

So my conclusion would be to use the default -e -6 with -T 0.

The following changes since commit 90ad663909c0c8a405b22a510c9f957007d02669:

  upstream_tracking: update boost (2012-07-09 17:21:38 +0100)

are available in the git repository at:

  git://git.yoctoproject.org/poky-contrib ag/xz
  http://git.yoctoproject.org/cgit.cgi/poky-contrib/log/?h=ag/xz

Andrei Gherzan (3):
  image_types.bbclass: Fix COMPRESS_CMD for xz to redirect compressed
    data to file
  image_types.bbclass: Add XZ variable to set number of threads to be
    used while compressing
  image_types.bbclass: Default XZ_COMPRESSION_LEVEL to -e -6

 meta/classes/image_types.bbclass |    5 +++--
 1 file changed, 3 insertions(+), 2 deletions(-)

-- 
1.7.9.5



