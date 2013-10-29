Return-Path: <sgw@linux.intel.com>
Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
	by mail.openembedded.org (Postfix) with ESMTP id 7B6736D42A
	for <openembedded-core@lists.openembedded.org>;
	Tue, 29 Oct 2013 19:34:49 +0000 (UTC)
Received: from orsmga002.jf.intel.com ([10.7.209.21])
	by orsmga101.jf.intel.com with ESMTP; 29 Oct 2013 12:34:51 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.93,535,1378882800"; d="scan'208";a="426650412"
Received: from unknown (HELO [10.255.12.29]) ([10.255.12.29])
	by orsmga002.jf.intel.com with ESMTP; 29 Oct 2013 12:34:51 -0700
Message-ID: <52700D71.9090809@linux.intel.com>
Date: Tue, 29 Oct 2013 12:33:05 -0700
From: Saul Wold <sgw@linux.intel.com>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:24.0) Gecko/20100101 Thunderbird/24.0
MIME-Version: 1.0
To: Paul Eggleton <paul.eggleton@linux.intel.com>, 
	openembedded-core@lists.openembedded.org
References: <1383060112-7835-1-git-send-email-paul.eggleton@linux.intel.com>
In-Reply-To: <1383060112-7835-1-git-send-email-paul.eggleton@linux.intel.com>
Subject: Re: [PATCH] scripts/oe-pkgdata-util: fix global name 'debug' is not defined
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
X-List-Received-Date: Tue, 29 Oct 2013 19:34:49 -0000
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit

On 10/29/2013 08:21 AM, Paul Eggleton wrote:
> This global variable is no longer present, so pass in the value
> specified via the command line.
>
This did not seem to fix the issue, I restarted the AB after this fix 
was in.

Sau!

> Signed-off-by: Paul Eggleton <paul.eggleton@linux.intel.com>
> ---
>   scripts/oe-pkgdata-util | 23 +++++++++++------------
>   1 file changed, 11 insertions(+), 12 deletions(-)
>
> diff --git a/scripts/oe-pkgdata-util b/scripts/oe-pkgdata-util
> index 80cacc5..17e946e 100755
> --- a/scripts/oe-pkgdata-util
> +++ b/scripts/oe-pkgdata-util
> @@ -28,8 +28,7 @@ import re
>   import optparse
>   from collections import defaultdict
>
> -
> -def glob(args, usage):
> +def glob(args, usage, debug=False):
>       if len(args) < 3:
>           usage()
>           sys.exit(1)
> @@ -148,7 +147,7 @@ def glob(args, usage):
>
>       print("\n".join(mappedpkgs))
>
> -def read_value(args, usage):
> +def read_value(args, usage, debug=False):
>       if len(args) < 3:
>           usage()
>           sys.exit(1)
> @@ -187,7 +186,7 @@ def read_value(args, usage):
>                   qvar = "%s_%s" % (var, mappedpkg)
>               print(readvar(revlink, qvar))
>
> -def lookup_pkg(args, usage):
> +def lookup_pkg(args, usage, debug=False):
>       if len(args) < 2:
>           usage()
>           sys.exit(1)
> @@ -219,7 +218,7 @@ def lookup_pkg(args, usage):
>           items.extend(mappings.get(pkg, []))
>       print '\n'.join(items)
>
> -def lookup_recipe(args, usage):
> +def lookup_recipe(args, usage, debug=False):
>       if len(args) < 2:
>           usage()
>           sys.exit(1)
> @@ -251,7 +250,7 @@ def lookup_recipe(args, usage):
>           items.extend(mappings.get(pkg, []))
>       print '\n'.join(items)
>
> -def find_path(args, usage):
> +def find_path(args, usage, debug=False):
>       if len(args) < 2:
>           usage()
>           sys.exit(1)
> @@ -306,7 +305,7 @@ Available commands:
>
>       parser.add_option("-d", "--debug",
>               help = "Report all SRCREV values, not just ones where AUTOREV has been used",
> -            action="store_true", dest="debug")
> +            action="store_true", dest="debug", default=False)
>
>       options, args = parser.parse_args(sys.argv)
>       args = args[1:]
> @@ -316,15 +315,15 @@ Available commands:
>           sys.exit(1)
>
>       if args[0] == "glob":
> -        glob(args[1:], parser.print_help)
> +        glob(args[1:], parser.print_help, options.debug)
>       elif args[0] == "lookup-pkg":
> -        lookup_pkg(args[1:], parser.print_help)
> +        lookup_pkg(args[1:], parser.print_help, options.debug)
>       elif args[0] == "lookup-recipe":
> -        lookup_recipe(args[1:], parser.print_help)
> +        lookup_recipe(args[1:], parser.print_help, options.debug)
>       elif args[0] == "find-path":
> -        find_path(args[1:], parser.print_help)
> +        find_path(args[1:], parser.print_help, options.debug)
>       elif args[0] == "read-value":
> -        read_value(args[1:], parser.print_help)
> +        read_value(args[1:], parser.print_help, options.debug)
>       else:
>           parser.print_help()
>           sys.exit(1)
>

