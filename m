Received: from mail.windriver.com ([147.11.1.11])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <mark.hatle@windriver.com>) id 1Tl2LN-00016q-0u
	for openembedded-core@lists.openembedded.org;
	Tue, 18 Dec 2012 19:56:53 +0100
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail.windriver.com (8.14.5/8.14.3) with ESMTP id qBIIg1Oi005409
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Tue, 18 Dec 2012 10:42:01 -0800 (PST)
Received: from msp-dhcp56.wrs.com (172.25.34.56) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server id 14.2.318.4;
	Tue, 18 Dec 2012 10:42:01 -0800
Message-ID: <50D0B8F8.60906@windriver.com>
Date: Tue, 18 Dec 2012 12:42:00 -0600
From: Mark Hatle <mark.hatle@windriver.com>
Organization: Wind River Systems
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.8;
	rv:17.0) Gecko/17.0 Thunderbird/17.0
MIME-Version: 1.0
To: <openembedded-core@lists.openembedded.org>
References: <1355758664-912-1-git-send-email-bogdan.a.marinescu@intel.com>
In-Reply-To: <1355758664-912-1-git-send-email-bogdan.a.marinescu@intel.com>
Subject: Re: [PATCH] python-smartpm: improve error reporting
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
X-List-Received-Date: Tue, 18 Dec 2012 18:56:53 -0000
Content-Type: text/plain; charset="ISO-8859-1"; format=flowed
Content-Transfer-Encoding: 7bit

On 12/17/12 9:37 AM, Bogdan Marinescu wrote:
> Add code to check proper command line arguments for various
> smart commands. Exit with error if erroneous/additional arguments
> are given in the command line.
>
> Signed-off-by: Bogdan Marinescu <bogdan.a.marinescu@intel.com>

I've reviewed this.  It looks like a good addition to 'smart'.

Signed-off-by: Mark Hatle <mark.hatle@windriver.com>

--Mark

> ---
>   .../smart-improve-error-reporting.patch            |  253 ++++++++++++++++++++
>   .../python/python-smartpm_1.4.1.bb                 |    3 +-
>   2 files changed, 255 insertions(+), 1 deletion(-)
>   create mode 100644 meta/recipes-devtools/python/python-smartpm/smart-improve-error-reporting.patch
>
> diff --git a/meta/recipes-devtools/python/python-smartpm/smart-improve-error-reporting.patch b/meta/recipes-devtools/python/python-smartpm/smart-improve-error-reporting.patch
> new file mode 100644
> index 0000000..fece5b9
> --- /dev/null
> +++ b/meta/recipes-devtools/python/python-smartpm/smart-improve-error-reporting.patch
> @@ -0,0 +1,253 @@
> +Improve error reporting in smart
> +
> +Add code to check proper command line arguments for various
> +smart commands. Exit with error if erroneous/additional arguments
> +are given in the command line.
> +
> +Upstream-Status: Pending
> +
> +Signed-off-by: Bogdan Marinescu <bogdan.a.marinescu@intel.com>
> +
> +diff --git a/smart/commands/channel.py b/smart/commands/channel.py
> +index aa76f91..63fbb35 100644
> +--- a/smart/commands/channel.py
> ++++ b/smart/commands/channel.py
> +@@ -157,7 +157,17 @@ def main(ctrl, opts):
> +                               opts.show is None and opts.yaml is None):
> +         iface.warning(_("Can't edit channels information."))
> +         raise Error, _("Configuration is in readonly mode.")
> +-
> ++
> ++    # Argument check
> ++    opts.check_args_of_option("set", -1)
> ++    opts.check_args_of_option("remove", -1)
> ++    opts.check_args_of_option("edit", 0)
> ++    opts.check_args_of_option("enable", -1)
> ++    opts.check_args_of_option("disable", -1)
> ++    opts.ensure_action("channel", ["add", "set", "remove", "remove-all",
> ++                       "list", "show", "yaml", "enable", "disable"])
> ++    opts.check_remaining_args()
> ++
> +     if opts.add is not None:
> +         if not opts.add and opts.args == ["-"]:
> +             newchannels = []
> +diff --git a/smart/commands/check.py b/smart/commands/check.py
> +index b08608a..506e852 100644
> +--- a/smart/commands/check.py
> ++++ b/smart/commands/check.py
> +@@ -72,6 +72,9 @@ def parse_options(argv):
> +
> + def main(ctrl, opts, reloadchannels=True):
> +
> ++    # Argument check
> ++    opts.check_args_of_option("channels", 1)
> ++
> +     if sysconf.get("auto-update"):
> +         from smart.commands import update
> +         updateopts = update.parse_options([])
> +diff --git a/smart/commands/config.py b/smart/commands/config.py
> +index dd50dee..4fe4366 100644
> +--- a/smart/commands/config.py
> ++++ b/smart/commands/config.py
> +@@ -80,6 +80,12 @@ def main(ctrl, opts):
> +     globals["false"] = False
> +     globals["no"] = False
> +
> ++    # Check arguments
> ++    opts.check_args_of_option("set", -1)
> ++    opts.check_args_of_option("remove", -1)
> ++    opts.ensure_action("config", ["set", "show", "yaml", "remove"])
> ++    opts.check_remaining_args()
> ++
> +     if opts.set:
> +         for opt in opts.set:
> +             m = SETRE.match(opt)
> +diff --git a/smart/commands/download.py b/smart/commands/download.py
> +index 6837993..b853c61 100644
> +--- a/smart/commands/download.py
> ++++ b/smart/commands/download.py
> +@@ -81,6 +81,14 @@ def parse_options(argv):
> +
> + def main(ctrl, opts):
> +
> ++    # Argument check
> ++    opts.check_args_of_option("target", 1)
> ++    opts.check_args_of_option("output", 1)
> ++    opts.check_args_of_option("from_urls", -1)
> ++    opts.check_args_of_option("from_metalink", -1)
> ++    if not opts.args and not opts.from_metalink and not opts.from_urls:
> ++        raise Error, _("no package(s) given")
> ++
> +     packages = []
> +     if opts.args:
> +         if sysconf.get("auto-update"):
> +diff --git a/smart/commands/info.py b/smart/commands/info.py
> +index 12f74f0..59fbe98 100644
> +--- a/smart/commands/info.py
> ++++ b/smart/commands/info.py
> +@@ -58,6 +58,10 @@ def parse_options(argv):
> +
> + def main(ctrl, opts, reloadchannels=True):
> +
> ++    # Argument check
> ++    if not opts.args:
> ++      raise Error, _("No package(s) given")
> ++
> +     if sysconf.get("auto-update"):
> +         from smart.commands import update
> +         updateopts = update.parse_options([])
> +diff --git a/smart/commands/install.py b/smart/commands/install.py
> +index 8a45954..590222c 100644
> +--- a/smart/commands/install.py
> ++++ b/smart/commands/install.py
> +@@ -76,6 +76,10 @@ def parse_options(argv):
> +
> + def main(ctrl, opts):
> +
> ++    # Argument check
> ++    if not opts.args:
> ++        raise Error, _("no package(s) given")
> ++
> +     if opts.explain:
> +         sysconf.set("explain-changesets", True, soft=True)
> +
> +diff --git a/smart/commands/reinstall.py b/smart/commands/reinstall.py
> +index e59d896..32da3e6 100644
> +--- a/smart/commands/reinstall.py
> ++++ b/smart/commands/reinstall.py
> +@@ -68,7 +68,11 @@ def parse_options(argv):
> +     return opts
> +
> + def main(ctrl, opts):
> +-
> ++
> ++    # Argument check
> ++    if not opts.args:
> ++        raise Error, _("no package(s) given")
> ++
> +     if opts.explain:
> +         sysconf.set("explain-changesets", True, soft=True)
> +
> +diff --git a/smart/commands/remove.py b/smart/commands/remove.py
> +index b4823a6..acd3bbd 100644
> +--- a/smart/commands/remove.py
> ++++ b/smart/commands/remove.py
> +@@ -74,6 +74,10 @@ def parse_options(argv):
> +
> + def main(ctrl, opts):
> +
> ++    # Argument check
> ++    if not opts.args:
> ++        raise Error, _("no package(s) given")
> ++
> +     if opts.explain:
> +         sysconf.set("explain-changesets", True, soft=True)
> +
> +diff --git a/smart/commands/search.py b/smart/commands/search.py
> +index 0d0b573..44806b8 100644
> +--- a/smart/commands/search.py
> ++++ b/smart/commands/search.py
> +@@ -44,6 +44,8 @@ def option_parser():
> + def parse_options(argv):
> +     opts = query.parse_options(argv, usage=USAGE, \
> +                                description=DESCRIPTION, examples=EXAMPLES)
> ++    if not argv:
> ++      raise Error, _("Search expression not specified")
> +     opts.name = opts.args
> +     opts.summary = opts.args
> +     opts.description = opts.args
> +diff --git a/smart/commands/upgrade.py b/smart/commands/upgrade.py
> +index ec86290..7e290d8 100644
> +--- a/smart/commands/upgrade.py
> ++++ b/smart/commands/upgrade.py
> +@@ -91,6 +91,9 @@ def parse_options(argv):
> +
> + def main(ctrl, opts):
> +
> ++    # Argument check
> ++    opts.check_args_of_option("flag", 1)
> ++
> +     if opts.explain:
> +         sysconf.set("explain-changesets", True, soft=True)
> +
> +diff --git a/smart/util/optparse.py b/smart/util/optparse.py
> +index 4a3d3a8..279b0bf 100644
> +--- a/smart/util/optparse.py
> ++++ b/smart/util/optparse.py
> +@@ -70,6 +70,8 @@ import sys, os
> + import types
> + import textwrap
> + from gettext import gettext as _
> ++from smart import Error
> ++import re
> +
> + def _repr(self):
> +     return "<%s at 0x%x: %s>" % (self.__class__.__name__, id(self), self)
> +@@ -708,6 +710,12 @@ class Option:
> +             self.action, self.dest, opt, value, values, parser)
> +
> +     def take_action(self, action, dest, opt, value, values, parser):
> ++        # Keep all the options in the command line in the '_given_opts' array
> ++        # This will be used later to validate the command line
> ++        given_opts = getattr(parser.values, "_given_opts", [])
> ++        user_opt = re.sub(r"^\-*", "", opt).replace("-", "_")
> ++        given_opts.append(user_opt)
> ++        setattr(parser.values, "_given_opts", given_opts)
> +         if action == "store":
> +             setattr(values, dest, value)
> +         elif action == "store_const":
> +@@ -819,6 +827,54 @@ class Values:
> +             setattr(self, attr, value)
> +         return getattr(self, attr)
> +
> ++    # Check if the given option has the specified number of arguments
> ++    # Raise an error if the option has an invalid number of arguments
> ++    # A negative number for 'nargs' means "at least |nargs| arguments are needed"
> ++    def check_args_of_option(self, opt, nargs, err=None):
> ++        given_opts = getattr(self, "_given_opts", [])
> ++        if not opt in given_opts:
> ++            return
> ++        values = getattr(self, opt, [])
> ++        if type(values) != type([]):
> ++            return
> ++        if nargs < 0:
> ++            nargs = -nargs
> ++            if len(values) >= nargs:
> ++                return
> ++            if not err:
> ++                if nargs == 1:
> ++                    err = _("Option '%s' requires at least one argument") % opt
> ++                else:
> ++                    err = _("Option '%s' requires at least %d arguments") % (opt, nargs)
> ++            raise Error, err
> ++        elif nargs == 0:
> ++            if len( values ) == 0:
> ++                return
> ++            raise Error, err
> ++        else:
> ++            if len(values) == nargs:
> ++                return
> ++            if not err:
> ++                if nargs == 1:
> ++                    err = _("Option '%s' requires one argument") % opt
> ++                else:
> ++                    err = _("Option '%s' requires %d arguments") % (opt, nargs)
> ++            raise Error, err
> ++
> ++    # Check that at least one of the options in 'actlist' was given as an argument
> ++    # to the command 'cmdname'
> ++    def ensure_action(self, cmdname, actlist):
> ++        given_opts = getattr(self, "_given_opts", [])
> ++        for action in actlist:
> ++            if action in given_opts:
> ++                return
> ++        raise Error, _("No action specified for command '%s'") % cmdname
> ++
> ++    # Check if there are any other arguments left after parsing the command line and
> ++    # raise an error if such arguments are found
> ++    def check_remaining_args(self):
> ++        if self.args:
> ++            raise Error, _("Invalid argument(s) '%s'" % str(self.args))
> +
> + class OptionContainer:
> +
> diff --git a/meta/recipes-devtools/python/python-smartpm_1.4.1.bb b/meta/recipes-devtools/python/python-smartpm_1.4.1.bb
> index 53f232b..ce1f435 100644
> --- a/meta/recipes-devtools/python/python-smartpm_1.4.1.bb
> +++ b/meta/recipes-devtools/python/python-smartpm_1.4.1.bb
> @@ -11,7 +11,7 @@ LICENSE = "GPLv2"
>   LIC_FILES_CHKSUM = "file://LICENSE;md5=393a5ca445f6965873eca0259a17f833"
>
>   DEPENDS = "python rpm"
> -PR = "r4"
> +PR = "r5"
>   SRCNAME = "smart"
>
>   SRC_URI = "\
> @@ -24,6 +24,7 @@ SRC_URI = "\
>             file://smart-rpm-md-parse.patch \
>             file://smart-tmpdir.patch \
>             file://smart-metadata-match.patch \
> +          file://smart-improve-error-reporting.patch \
>             "
>
>   SRC_URI[md5sum] = "573ef32ba177a6b3c4bf7ef04873fcb6"
>



