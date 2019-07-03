Return-Path: <Qi.Chen@windriver.com>
Received: from mail5.wrs.com (mail5.windriver.com [192.103.53.11])
	by mail.openembedded.org (Postfix) with ESMTP id 2AB2B7E725
	for <openembedded-core@lists.openembedded.org>;
	Wed,  3 Jul 2019 02:08:19 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail5.wrs.com (8.15.2/8.15.2) with ESMTPS id x63273Tp029849
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL);
	Tue, 2 Jul 2019 19:07:14 -0700
Received: from [128.224.162.148] (128.224.162.148) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server (TLS) id 14.3.439.0;
	Tue, 2 Jul 2019 19:06:53 -0700
To: =?UTF-8?B?QW7DrWJhbCBMaW3Ds24=?= <anibal.limon@linaro.org>,
	<openembedded-core@lists.openembedded.org>
References: <20190701212350.32503-1-anibal.limon@linaro.org>
From: ChenQi <Qi.Chen@windriver.com>
Message-ID: <f6a6bb77-b965-803f-426a-1074cf7e605b@windriver.com>
Date: Wed, 3 Jul 2019 10:19:17 +0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:45.0) Gecko/20100101
	Thunderbird/45.4.0
MIME-Version: 1.0
In-Reply-To: <20190701212350.32503-1-anibal.limon@linaro.org>
X-Originating-IP: [128.224.162.148]
Subject: Re: [PATCHv3 1/3] runqemu: Allow to store more than one lock for network interfaces
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
X-List-Received-Date: Wed, 03 Jul 2019 02:08:19 -0000
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Transfer-Encoding: 8bit

Could you please help check if the following failures are related to 
this patch series?
https://autobuilder.yoctoproject.org/typhoon/#/builders/47/builds/785/steps/7/logs/step1c
https://autobuilder.yoctoproject.org/typhoon/#/builders/63/builds/766/steps/7/logs/step1c

Regards,
Chen Qi

On 07/02/2019 05:23 AM, Aníbal Limón wrote:
> In order to support multiple tap devices in the same qemu virtual
> machine.
>
> Signed-off-by: Aníbal Limón <anibal.limon@linaro.org>
> ---
>   scripts/runqemu | 50 +++++++++++++++++++++++++------------------------
>   1 file changed, 26 insertions(+), 24 deletions(-)
>
> diff --git a/scripts/runqemu b/scripts/runqemu
> index 4079f2b17d..38dd1c30d9 100755
> --- a/scripts/runqemu
> +++ b/scripts/runqemu
> @@ -181,8 +181,7 @@ class BaseConfig(object):
>           self.audio_enabled = False
>           self.tcpserial_portnum = ''
>           self.custombiosdir = ''
> -        self.lock = ''
> -        self.lock_descriptor = None
> +        self.lock_descriptors = {}
>           self.bitbake_e = ''
>           self.snapshot = False
>           self.wictypes = ('wic', 'wic.vmdk', 'wic.qcow2', 'wic.vdi')
> @@ -204,30 +203,32 @@ class BaseConfig(object):
>           # avoid cleanup twice
>           self.cleaned = False
>   
> -    def acquire_lock(self, error=True):
> -        logger.debug("Acquiring lockfile %s..." % self.lock)
> +    def acquire_lock(self, lock, error=True):
> +        logger.debug("Acquiring lockfile %s..." % lock)
> +        descriptor = None
>           try:
> -            self.lock_descriptor = open(self.lock, 'w')
> -            fcntl.flock(self.lock_descriptor, fcntl.LOCK_EX|fcntl.LOCK_NB)
> +            descriptor = open(lock, 'w')
> +            fcntl.flock(descriptor, fcntl.LOCK_EX|fcntl.LOCK_NB)
>           except Exception as e:
> -            msg = "Acquiring lockfile %s failed: %s" % (self.lock, e)
> +            msg = "Acquiring lockfile %s failed: %s" % (lock, e)
>               if error:
>                   logger.error(msg)
>               else:
>                   logger.info(msg)
> -            if self.lock_descriptor:
> -                self.lock_descriptor.close()
> -                self.lock_descriptor = None
> +            if descriptor:
> +                descriptor.close()
> +                descriptor = None
>               return False
> +        self.lock_descriptors[lock] = descriptor
>           return True
>   
> -    def release_lock(self):
> -        if self.lock_descriptor:
> -            logger.debug("Releasing lockfile for tap device '%s'" % self.tap)
> -            fcntl.flock(self.lock_descriptor, fcntl.LOCK_UN)
> -            self.lock_descriptor.close()
> -            os.remove(self.lock)
> -            self.lock_descriptor = None
> +    def release_lock(self, lock):
> +        if self.lock_descriptors[lock]:
> +            logger.debug("Releasing lockfile for tap device '%s'" % lock)
> +            fcntl.flock(self.lock_descriptors[lock], fcntl.LOCK_UN)
> +            self.lock_descriptors[lock].close()
> +            os.remove(lock)
> +            self.lock_descriptors[lock] = None
>   
>       def get(self, key):
>           if key in self.d:
> @@ -1016,8 +1017,8 @@ class BaseConfig(object):
>               if os.path.exists('%s.skip' % lockfile):
>                   logger.info('Found %s.skip, skipping %s' % (lockfile, p))
>                   continue
> -            self.lock = lockfile + '.lock'
> -            if self.acquire_lock(error=False):
> +            lock = lockfile + '.lock'
> +            if self.acquire_lock(lock, error=False):
>                   tap = p
>                   logger.info("Using preconfigured tap device %s" % tap)
>                   logger.info("If this is not intended, touch %s.skip to make runqemu skip %s." %(lockfile, tap))
> @@ -1035,8 +1036,8 @@ class BaseConfig(object):
>               cmd = ('sudo', self.qemuifup, str(uid), str(gid), self.bindir_native)
>               tap = subprocess.check_output(cmd).decode('utf-8').strip()
>               lockfile = os.path.join(lockdir, tap)
> -            self.lock = lockfile + '.lock'
> -            self.acquire_lock()
> +            lock = lockfile + '.lock'
> +            self.acquire_lock(lock)
>               self.cleantap = True
>               logger.debug('Created tap: %s' % tap)
>   
> @@ -1268,8 +1269,8 @@ class BaseConfig(object):
>           cmds = shlex.split(cmd)
>           logger.info('Running %s\n' % cmd)
>           pass_fds = []
> -        if self.lock_descriptor:
> -            pass_fds = [self.lock_descriptor.fileno()]
> +        if self.lock_descriptors.keys():
> +            pass_fds = [self.lock_descriptors[lock].fileno() for lock in self.lock_descriptors.keys()]
>           process = subprocess.Popen(cmds, stderr=subprocess.PIPE, pass_fds=pass_fds)
>           self.qemupid = process.pid
>           retcode = process.wait()
> @@ -1291,7 +1292,8 @@ class BaseConfig(object):
>               cmd = ('sudo', self.qemuifdown, self.tap, self.bindir_native)
>               logger.debug('Running %s' % str(cmd))
>               subprocess.check_call(cmd)
> -        self.release_lock()
> +        for lock in self.lock_descriptors.keys():
> +            self.release_lock(lock)
>   
>           if self.nfs_running:
>               logger.info("Shutting down the userspace NFS server...")



