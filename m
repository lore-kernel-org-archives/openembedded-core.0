Return-Path: <denis@denix.org>
Received: from vms173021pub.verizon.net (vms173021pub.verizon.net
	[206.46.173.21])
	by mail.openembedded.org (Postfix) with ESMTP id 8A9BE61566
	for <openembedded-core@lists.openembedded.org>;
	Fri,  6 Sep 2013 18:58:25 +0000 (UTC)
Received: from gandalf.denix.org ([unknown] [108.45.150.102])
	by vms173021.mailsrvcs.net
	(Sun Java(tm) System Messaging Server 7u2-7.02 32bit (built Apr 16
	2009)) with ESMTPA id <0MSP00FAEWO5X300@vms173021.mailsrvcs.net> for
	openembedded-core@lists.openembedded.org;
	Fri, 06 Sep 2013 13:57:57 -0500 (CDT)
Received: by gandalf.denix.org (Postfix, from userid 1000)	id AA6EE2009D; Fri,
	06 Sep 2013 14:57:41 -0400 (EDT)
Date: Fri, 06 Sep 2013 14:57:41 -0400
From: Denys Dmytriyenko <denis@denix.org>
To: openembedded-core@lists.openembedded.org
Message-id: <20130906185741.GA5834@denix.org>
MIME-version: 1.0
User-Agent: Mutt/1.5.20 (2009-06-14)
Subject: eglibc_2.17.bb: Failure expanding variable SELECTED_OPTIMIZATION[:=]
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
X-List-Received-Date: Fri, 06 Sep 2013 18:58:26 -0000
Content-type: text/plain; charset=us-ascii
Content-disposition: inline

Hi,

Has anyone seen this error before? It happens for me quite often, but not 
always, on Dylan branch during initial parsing:

Parsing recipes...
ERROR: ExpansionError during parsing .../oe-core/meta/recipes-core/eglibc/eglibc_2.17.bb:
  Failure expanding variable SELECTED_OPTIMIZATION[:=], expression was ${@get_optimization(d)}
  which triggered exception NameError: name 'get_optimization' is not defined
ERROR: Command execution failed: Exited with 1


Looking at the code, I don't see anything suspicious:

# eglibc can't be built without optimization, if someone tries to compile an
# entire image as -O0, we override it with -O2 here and give a note about it.
def get_optimization(d):
    selected_optimization = d.getVar("SELECTED_OPTIMIZATION", True)
    if base_contains("SELECTED_OPTIMIZATION", "-O0", "x", "", d) == "x":
        bb.note("eglibc can't be built with -O0, -O2 will be used instead.")
        return selected_optimization.replace("-O0", "-O2")
    return selected_optimization

SELECTED_OPTIMIZATION := "${@get_optimization(d)}"


It sounds like by the time SELECTED_OPTIMIZATION tries to make an assignment 
with immediate var expansion, get_optimization() function is not yet defined.

This happens with high BB_NUM_THREADS and bitbake 1.18. Trying bitbake from 
master on Dylan gives "AttributeError: 'NoneType' object has no attribute 
'rfind'", but that's another story.

Anyone has any clues or suggestions? Thanks.

-- 
Denys

