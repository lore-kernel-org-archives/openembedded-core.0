Return-Path: <Hongxu.Jia@windriver.com>
Received: from mail1.windriver.com (mail1.windriver.com [147.11.146.13])
	by mail.openembedded.org (Postfix) with ESMTP id 16C8B7070E
	for <openembedded-core@lists.openembedded.org>;
	Wed, 27 Aug 2014 10:23:59 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail1.windriver.com (8.14.9/8.14.5) with ESMTP id s7RAO0dQ023188
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Wed, 27 Aug 2014 03:24:00 -0700 (PDT)
Received: from [128.224.162.194] (128.224.162.194) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.40) with Microsoft SMTP Server id 14.3.174.1;
	Wed, 27 Aug 2014 03:24:00 -0700
Message-ID: <53FDB1B9.9020809@windriver.com>
Date: Wed, 27 Aug 2014 18:23:53 +0800
From: Hongxu Jia <hongxu.jia@windriver.com>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:31.0) Gecko/20100101 Thunderbird/31.0
MIME-Version: 1.0
To: <openembedded-core@lists.openembedded.org>
References: <cover.1409124921.git.hongxu.jia@windriver.com>
	<b2c9844ccac90203b25aa89884b1e10b12a4c0d8.1409124921.git.hongxu.jia@windriver.com>
In-Reply-To: <b2c9844ccac90203b25aa89884b1e10b12a4c0d8.1409124921.git.hongxu.jia@windriver.com>
Subject: Re: [PATCH 1/3] bitbake: runqueue: terminate build safely while RunQueueExecuteScenequeue init failed
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
X-List-Received-Date: Wed, 27 Aug 2014 10:24:06 -0000
Content-Type: text/plain; charset="windows-1252"; format=flowed
Content-Transfer-Encoding: quoted-printable

I will resend this patch to bitbake mailing list=20
bitbake-devel@lists.openembedded.org,
sorry for the wrong place.

//Hongxu

On 08/27/2014 03:53 PM, Hongxu Jia wrote:
> While RunQueueExecuteScenequeue init failed, the exit of build is mess.=

> Here is the example while bb.fatal invoked in RunQueueExecuteScenequeue=
:
> ...
> Traceback (most recent call last):
>    File "/home/jiahongxu/yocto/poky/bitbake/lib/bb/runqueue.py", line 1=
824, in RunQueueExecuteScenequeue.__init__(rq=3D<bb.runqueue.RunQueue ins=
tance at 0x7f87dd7d5050>):
>                   locs =3D { "sq_fn" : sq_fn, "sq_task" : sq_taskname, =
"sq_hash" : sq_hash, "sq_hashfn" : sq_hashfn, "d" : self.cooker.data }
>      >            valid =3D bb.utils.better_eval(call, locs)
>
>    File "/home/jiahongxu/yocto/poky/bitbake/lib/bb/utils.py", line 374,=
 in better_eval(source=3D'sstate_checkhashes(sq_fn, sq_task, sq_hash, sq_=
hashfn, d)', locals=3D{'sq_fn': ['virtual:native:/home/jiahongxu/yocto/po=
ky/meta/recipes-support/db/db_6.0.30.bb', 'virtual:native:/home/jiahongxu=
/yocto/poky/meta/recipes-support/db/db_6.0.30.bb', 'virtual:native:/home/=
jiahongxu/yocto/poky/meta/recipes-support/db/db_6.0.30.bb'], 'sq_task': [=
'do_populate_sysroot', 'do_populate_lic', 'do_package_qa'], 'sq_hash': ['=
7d132e7705b5772accce5544cf785c70', '52387c5751c018ddfe2c6a5eecf59e36', '3=
15bcde98908fd36442830f9ae7469c1'], 'sq_hashfn': ['Ubuntu-14.04/ sstate:db=
-native:x86_64-linux:6.0.30:r0:x86_64:3: sstate:db::6.0.30:r0::3:', 'Ubun=
tu-14.04/ sstate:db-native:x86_64-linux:6.0.30:r0:x86_64:3: sstate:db::6.=
0.30:r0::3:', 'Ubuntu-14.04/ sstate:db-native:x86_64-linux:6.0.30:r0:x86_=
64:3: sstate:db::6.0.30:r0::3:'], 'd': <bb.data_smart.DataSmart object at=
 0x7f87e15cde10>}):
>       def better_eval(source, locals):
>      >    return eval(source, get_context(), locals)
>
>    File "<string>", line 1, in <module>
>    File "sstate.bbclass", line 110, in sstate_checkhashes(sq_fn=3D['vir=
tual:native:/home/jiahongxu/yocto/poky/meta/recipes-support/db/db_6.0.30.=
bb', 'virtual:native:/home/jiahongxu/yocto/poky/meta/recipes-support/db/d=
b_6.0.30.bb', 'virtual:native:/home/jiahongxu/yocto/poky/meta/recipes-sup=
port/db/db_6.0.30.bb'], sq_task=3D['do_populate_sysroot', 'do_populate_li=
c', 'do_package_qa'], sq_hash=3D['7d132e7705b5772accce5544cf785c70', '523=
87c5751c018ddfe2c6a5eecf59e36', '315bcde98908fd36442830f9ae7469c1'], sq_h=
ashfn=3D['Ubuntu-14.04/ sstate:db-native:x86_64-linux:6.0.30:r0:x86_64:3:=
 sstate:db::6.0.30:r0::3:', 'Ubuntu-14.04/ sstate:db-native:x86_64-linux:=
6.0.30:r0:x86_64:3: sstate:db::6.0.30:r0::3:', 'Ubuntu-14.04/ sstate:db-n=
ative:x86_64-linux:6.0.30:r0:x86_64:3: sstate:db::6.0.30:r0::3:'], d=3D<b=
b.data_smart.DataSmart object at 0x7f87e15cde10>)
>    File "/home/jiahongxu/yocto/poky/bitbake/lib/bb/__init__.py", line 1=
02, in fatal:
>           logger.critical(''.join(args))
>      >    raise BBHandledException()
>
> BBHandledException
> ...
>
> We should terminate build safely while RunQueueExecuteScenequeue init f=
ailed.
>
> Signed-off-by: Hongxu Jia <hongxu.jia@windriver.com>
> ---
>   bitbake/lib/bb/runqueue.py | 7 ++++++-
>   1 file changed, 6 insertions(+), 1 deletion(-)
>
> diff --git a/bitbake/lib/bb/runqueue.py b/bitbake/lib/bb/runqueue.py
> index e13dc57..c7b1dc0 100644
> --- a/bitbake/lib/bb/runqueue.py
> +++ b/bitbake/lib/bb/runqueue.py
> @@ -1046,7 +1046,12 @@ class RunQueue:
>                   self.state =3D runQueueComplete
>               else:
>                   self.start_worker()
> -                self.rqexe =3D RunQueueExecuteScenequeue(self)
> +                try:
> +                    self.rqexe =3D RunQueueExecuteScenequeue(self)
> +                except:
> +                    # The RunQueueExecuteScenequeue init failure
> +                    # terminated the build safely
> +                    self.state =3D runQueueComplete
>  =20
>           if self.state in [runQueueSceneRun, runQueueRunning, runQueue=
CleanUp]:
>               self.dm.check(self)



