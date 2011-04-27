Received: from mga01.intel.com ([192.55.52.88])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <josh@linux.intel.com>) id 1QF9OK-0005iy-0p
	for openembedded-core@lists.openembedded.org;
	Wed, 27 Apr 2011 20:23:12 +0200
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
	by fmsmga101.fm.intel.com with ESMTP; 27 Apr 2011 11:20:36 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.64,275,1301900400"; d="scan'208";a="684862073"
Received: from unknown (HELO [10.255.13.15]) ([10.255.13.15])
	by fmsmga002.fm.intel.com with ESMTP; 27 Apr 2011 11:20:30 -0700
From: Joshua Lock <josh@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Wed, 27 Apr 2011 11:20:30 -0700
In-Reply-To: <62bdbb0395a252561a1b9779633b29403b049304.1303890720.git.liping.ke@intel.com>
References: <cover.1303890720.git.liping.ke@intel.com>
	<62bdbb0395a252561a1b9779633b29403b049304.1303890720.git.liping.ke@intel.com>
X-Mailer: Evolution 3.0.0 (3.0.0-1.fc15) 
Message-ID: <1303928430.2242.7.camel@scimitar>
Mime-Version: 1.0
Subject: Re: [PATCH 1/1] Image Creator: Make bitbake servertype configurable
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
X-List-Received-Date: Wed, 27 Apr 2011 18:23:12 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Wed, 2011-04-27 at 15:53 +0800, Liping Ke wrote:
> From: Liping Ke <liping.ke@intel.com>
> 
> add -t options for configuring bitbake server (xmlrpc, none)
> 
> Signed-off-by: Liping Ke <liping.ke@intel.com>
> ---
>  bitbake/bin/bitbake |   18 +++++++++++++-----
>  1 files changed, 13 insertions(+), 5 deletions(-)
> 
> diff --git a/bitbake/bin/bitbake b/bitbake/bin/bitbake
> index 6d05289..9e8d9a1 100755
> --- a/bitbake/bin/bitbake
> +++ b/bitbake/bin/bitbake
> @@ -39,8 +39,6 @@ import bb.msg
>  from bb import cooker
>  from bb import ui
>  from bb import server
> -from bb.server import none
> -#from bb.server import xmlrpc
>  
>  __version__ = "1.11.0"
>  logger = logging.getLogger("BitBake")
> @@ -71,7 +69,7 @@ def get_ui(config):
>          return getattr(module, interface).main
>      except AttributeError:
>          sys.exit("FATAL: Invalid user interface '%s' specified.\n"
> -                 "Valid interfaces: depexp, goggle, ncurses, knotty [default]." % interface)
> +                 "Valid interfaces: depexp, goggle, ncurses, hob, knotty [default]." % interface)
>  
> 
>  # Display bitbake/OE warnings via the BitBake.Warnings logger, ignoring others"""
> @@ -161,6 +159,9 @@ Default BBFILES are the .bb files in the current directory.""")
>      parser.add_option("-u", "--ui", help = "userinterface to use",
>                 action = "store", dest = "ui")
>  
> +    parser.add_option("-t", "--servertype", help = "choose which server to user, none or xmlrpc",
> +               action = "store", dest = "servertype")
> +
>      parser.add_option("", "--revisions-changed", help = "Set the exit code depending on whether upstream floating revisions have changed or not",
>                 action = "store_true", dest = "revisions_changed", default = False)
>  
> @@ -175,8 +176,15 @@ Default BBFILES are the .bb files in the current directory.""")
>      loghandler = event.LogHandler()
>      logger.addHandler(loghandler)
>  
> -    #server = bb.server.xmlrpc
> -    server = bb.server.none
> +    # Server type could be xmlrpc or none currently, if nothing is specified,
> +    # default server would be none
> +    if configuration.servertype:
> +        server_type = configuration.servertype
> +    else:
> +        server_type = 'none'
> +
> +    module = __import__("bb.server", fromlist = [server_type])
> +    server = getattr(module, server_type)

What if the module import fails? You'll note that the similar code to
allow selection of the UI with a switch is wrapped in a try/except.
Can we do the same here?

Thanks,
Joshua
-- 
Joshua Lock
        Yocto Build System Monkey
        Intel Open Source Technology Centre



