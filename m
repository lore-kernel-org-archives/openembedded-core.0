Received: from relay9-d.mail.gandi.net (relay9-d.mail.gandi.net [217.70.183.199])
 by mx.groups.io with SMTP id smtpd.web10.2088.1625082771840185279
 for <openembedded-core@lists.openembedded.org>;
 Wed, 30 Jun 2021 12:52:52 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=pass (domain: bootlin.com, ip: 217.70.183.199, mailfrom: alexandre.belloni@bootlin.com)
Received: (Authenticated sender: alexandre.belloni@bootlin.com)
	by relay9-d.mail.gandi.net (Postfix) with ESMTPSA id 33F59FF807;
	Wed, 30 Jun 2021 19:52:48 +0000 (UTC)
Date: Wed, 30 Jun 2021 21:52:48 +0200
From: "Alexandre Belloni" <alexandre.belloni@bootlin.com>
To: Saul Wold <Saul.Wold@windriver.com>
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [OE-core] [PATCH 2/3] oeqa/dump.py: Add support for QMP command arguments
Message-ID: <YNzLkLTOrICDIM7q@piout.net>
References: <20210629145703.979269-1-saul.wold@windriver.com>
 <20210629145703.979269-2-saul.wold@windriver.com>
MIME-Version: 1.0
In-Reply-To: <20210629145703.979269-2-saul.wold@windriver.com>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hello Saul,

On 29/06/2021 07:57:02-0700, Saul Wold wrote:
> Need to ensure that the dump_dir is created correctly and available
> When command arguemnts are passed construct a filename if needed and
> convert the arguements to a json object to pass to QMP.
> 
> Signed-off-by: Saul Wold <saul.wold@windriver.com>
> ---
>  meta/lib/oeqa/targetcontrol.py |  2 ++
>  meta/lib/oeqa/utils/dump.py    | 23 ++++++++++++++++++-----
>  2 files changed, 20 insertions(+), 5 deletions(-)
> 
> diff --git a/meta/lib/oeqa/targetcontrol.py b/meta/lib/oeqa/targetcontrol.py
> index 005ebaa7f39..5b925e4fa4f 100644
> --- a/meta/lib/oeqa/targetcontrol.py
> +++ b/meta/lib/oeqa/targetcontrol.py
> @@ -152,6 +152,8 @@ class QemuTarget(BaseTarget):
>  
>          self.target_dumper = TargetDumper(dump_target_cmds, dump_dir, self.runner)
>          self.monitor_dumper = MonitorDumper(dump_monitor_cmds, dump_dir, self.runner)
> +        if (self.monitor_dumper):
> +            self.host_dumper.create_dir("qmp")
>  

This seems to fail:
2021-06-30 01:10:20,391 - oe-selftest - INFO - testtools.testresult.real._StringException: Traceback (most recent call last):
  File "/home/pokybuild/yocto-worker/qemux86/build/meta/lib/oeqa/selftest/cases/gcc.py", line 151, in test_libitm
    self.run_check_emulated("libitm")
  File "/home/pokybuild/yocto-worker/qemux86/build/meta/lib/oeqa/selftest/cases/gcc.py", line 72, in run_check_emulated
    with runqemu("core-image-minimal", runqemuparams = "nographic") as qemu:
  File "/usr/lib64/python3.6/contextlib.py", line 81, in __enter__
    return next(self.gen)
  File "/home/pokybuild/yocto-worker/qemux86/build/meta/lib/oeqa/utils/commands.py", line 340, in runqemu
    qemu = oeqa.targetcontrol.QemuTarget(recipedata, targetlogger, image_fstype)
  File "/home/pokybuild/yocto-worker/qemux86/build/meta/lib/oeqa/targetcontrol.py", line 156, in __init__
    self.host_dumper.create_dir("qmp")
AttributeError: 'QemuTarget' object has no attribute 'host_dumper'

https://autobuilder.yoctoproject.org/typhoon/#/builders/59/builds/3602/steps/18/logs/stdio
https://autobuilder.yoctoproject.org/typhoon/#/builders/79/builds/2260/steps/14/logs/stdio
https://autobuilder.yoctoproject.org/typhoon/#/builders/80/builds/2237/steps/14/logs/stdio
https://autobuilder.yoctoproject.org/typhoon/#/builders/86/builds/2239/steps/14/logs/stdio
https://autobuilder.yoctoproject.org/typhoon/#/builders/87/builds/2274/steps/14/logs/stdio


>      def deploy(self):
>          bb.utils.mkdirhier(self.testdir)
> diff --git a/meta/lib/oeqa/utils/dump.py b/meta/lib/oeqa/utils/dump.py
> index 843e19fe8a6..bb067f48462 100644
> --- a/meta/lib/oeqa/utils/dump.py
> +++ b/meta/lib/oeqa/utils/dump.py
> @@ -18,6 +18,7 @@ class BaseDumper(object):
>          # Some testing doesn't inherit testimage, so it is needed
>          # to set some defaults.
>          self.parent_dir = parent_dir
> +        self.dump_dir = parent_dir
>          dft_cmds = """  top -bn1
>                          iostat -x -z -N -d -p ALL 20 2
>                          ps -ef
> @@ -47,7 +48,7 @@ class BaseDumper(object):
>                  raise err
>          self.dump_dir = dump_dir
>  
> -    def _write_dump(self, command, output):
> +    def _construct_filename(self, command):
>          if isinstance(self, HostDumper):
>              prefix = "host"
>          elif isinstance(self, TargetDumper):
> @@ -61,6 +62,10 @@ class BaseDumper(object):
>              fullname = os.path.join(self.dump_dir, filename)
>              if not os.path.exists(fullname):
>                  break
> +        return fullname
> +
> +    def _write_dump(self, command, output):
> +        fullname = self._construct_filename(command)
>          if isinstance(self, MonitorDumper):
>              with open(fullname, 'w') as json_file:
>                  json.dump(output, json_file, indent=4)
> @@ -117,8 +122,16 @@ class MonitorDumper(BaseDumper):
>          if dump_dir:
>              self.dump_dir = dump_dir
>          for cmd in self.cmds:
> +            cmd_name = cmd.split()[0]
>              try:
> -                output = self.runner.run_monitor(cmd)
> -                self._write_dump(cmd, output)
> -            except:
> -                print("Failed to dump QMP CMD: %s" % (cmd))
> +                if len(cmd.split()) > 1:
> +                    cmd_args = cmd.split()[1]
> +                    if "%s" in cmd_args:
> +                        filename = self._construct_filename(cmd_name)
> +                    cmd_data = json.loads(cmd_args % (filename))
> +                    output = self.runner.run_monitor(cmd_name, cmd_data)
> +                else:
> +                    output = self.runner.run_monitor(cmd_name)
> +                self._write_dump(cmd_name, output)
> +            except Exception as e:
> +                print("Failed to dump QMP CMD: %s with\nExecption: %s" % (cmd_name, e))
> -- 
> 2.25.1
> 

> 
> 
> 


-- 
Alexandre Belloni, co-owner and COO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
